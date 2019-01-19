# ActiveMQ


## 引入

### What

- 定义
  ActiveMQ是一个MOM，具体来说是一个实现了JMS规范的系统间远程通信的消息代理。

- MOM
  MOM：面向消息中间件（Message oriented middleware），是用于以分布式应用或系统中的异步、松耦合、可靠、可扩展和安全通信的一类软件。MOM 的总体思想是它作为消息发送器和消息接收器之间的消息中介,这种中介提供了一个全新水平的松耦合。

- JMS
  JMS即Java消息服务（Java Message Service）应用程序接口，是一个Java平台中关于面向消息中间件（MOM）的API，用于在两个应用程序之间，或分布式系统中发送消息，进行异步通信

### Why

### When

 异步调用  
一对多通信   
做多个系统的集成，同构、异构   
作为RPC的替代   
多个应用相互解耦   
作为事件驱动架构的幕后支撑   
为了提高系统的可伸缩性

### How

- 通用步骤
  获取连接工厂  
  使用连接工厂创建连接  
  启动连接  
  从连接创建会话  
  获取 Destination  
  创建 Producer，或  
  创建 Producer  
  创建 message  
  创建 Consumer，或发送或接收message发送或接收 message  
  创建 Consumer  
  注册消息监听器（可选）  
  发送或接收 message  
  关闭资源（connection, session, producer, consumer 等)

- 代码示例
  public class JMSDemo {  
          ConnectionFactory connectionFactory;  
          Connection connection;  
          Session session;  
          Destination destination;  
          MessageProducer producer;  
          MessageConsumer consumer;  
          Message message;  
          boolean useTransaction = false;  
          try {  
                  Context ctx = new InitialContext();  
                  connectionFactory = (ConnectionFactory) ctx.lookup("ConnectionFactoryName");  
                  //使用ActiveMQ时：connectionFactory = new ActiveMQConnectionFactory(user, password, getOptimizeBrokerUrl(broker));  
                  connection = connectionFactory.createConnection();  
                  connection.start();  
                  session = connection.createSession(useTransaction, Session.AUTO_ACKNOWLEDGE);  
                  destination = session.createQueue("TEST.QUEUE");  
                  //生产者发送消息  
                  producer = session.createProducer(destination);  
                  message = session.createTextMessage("this is a test");  
    
                  //消费者同步接收  
                  consumer = session.createConsumer(destination);  
                  message = (TextMessage) consumer.receive(1000);  
                  System.out.println("Received message: " + message);  
                  //消费者异步接收  
                  consumer.setMessageListener(new MessageListener() {  
                          @Override  
                          public void onMessage(Message message) {  
                                  if (message != null) {  
                                          doMessageEvent(message);  
                                  }  
                          }  
                  });  
          } catch (JMSException e) {  
                  ...  
          } finally {  
                  producer.close();  
                  session.close();  
                  connection.close();  
          }  
  }

## 基本概念

### Provider

实现JMS接口和规范的消息中间件

### Domains

消息传递方式，包括点对点（P2P）、发布/订阅（Pub/Sub）两种

- P2P
  P2P （点对点）消息域使用 queue 作为 Destination，消息可以被同步或异步的发送和接收，每个消息只会给一个 Consumer 传送一次。  
    
  Consumer 可以使用 MessageConsumer.receive() 同步地接收消息，也可以通过使用MessageConsumer.setMessageListener() 注册一个 MessageListener 实现异步接收。  
    
  多个 Consumer 可以注册到同一个 queue 上，但一个消息只能被一个 Consumer 所接收，然后由该 Consumer 来确认消息。并且在这种情况下，Provider 对所有注册的 Consumer 以轮询的方式发送消息。

- Pub/Sub
  Pub/Sub（发布/订阅，Publish/Subscribe）消息域使用 topic 作为 Destination，发布者向 topic 发送消息，订阅者注册接收来自 topic 的消息。发送到 topic 的任何消息都将自动传递给所有订阅者。接收方式（同步和异步）与 P2P 域相同。  
    
  除非显式指定，否则 topic 不会为订阅者保留消息。当然，这可以通过持久化（Durable）订阅来实现消息的保存。这种情况下，当订阅者与 Provider 断开时，Provider 会为它存储消息。当持久化订阅者重新连接时，将会受到所有的断连期间未消费的消息。

- 
![](assets/0500173B-92D0-451B-8B08-2430949C1C03.png)

### Connection Factory

客户端使用连接工厂来创建与 JMS provider 的连接

### Destination

消息被寻址、发送以及接收的对象

## 支持的传输协议

1、TCP  
2、NIO  
3、UDP  
4、SSL  
5、HTTP  
6、VM

## 消息的存储方式

1、KahaDB  
2、AMQ  
3、JDBC  
4、Memory

## 单机集群

步骤如下:  
1、把整个conf文件夹复制一份，比如叫做conf2  
  
2、修改里面的activemq.xml文件   
(1)里面的brokerName不能跟原来的重复   
(2)数据存放的文件名称不能重复，比如:  
< kahaDB directory = " ${ activemq.data } / kahadb_2 " / >   
(3)所有涉及的transportConnectors的端口，都要跟前面的不一样  
  
3、修改jetty. xml ，主要就是修改端口，比如:  
<propertyname=“port ” value=“8181”/ > 端口必须和前面的不一样  
  
4、到bin下面，复制一个activemq，比如叫做activemq2:   
(1)修改程序的id，不能和前面的重复  
ACTIVEMQ_PIDFILE="$ACTIVEMQ_DATA/ activemq2- ` hostname` . pid"   
(2)修改配置文件路径  
ACTIVEMQ_CONF="$ACTIVEMQ_BASE/ conf2"  
(3)修改端口，里面有个tcp的61616的端口，要改成不一样的，最好跟activemq. xml里面的tcp的端口一致   
(4)然后就可以执行了，如果执行没有权限的话，就授权:chmod751activemq2  
 

## 网络连接

### 1、静态网络连接

<net wor kConnect or s>  
<networkConnector name="local network"  
uri="static://(tcp://remotehost1:61616,tcp://remotehost2:61616)"/> </ net wor kConnect or s>  
   
  
=====================  
  
  
<networkConnectors>  
　　　　<networkConnector uri="static://(tcp://remotehost:61617)"  
                              name="queues_only"  
                              duplex="true"  
　　　　　　　　<excludedDestinations>  
　　　　　　　　　　　　<topic physicalName=">"/>  
　　　　　　　　</excludedDestinations>  
　　　　</networkConnector>  
　　　　<networkConnector uri="static://(tcp://remotehost:61617)"  
                              name="topics_only"  
                              duplex="true"  
　　　　　　　　<excludedDestinations>  
　　　　　　　　　　　　<queue physicalName=">"/>  
　　　　　　　　</excludedDestinations>  
　　　　</networkConnector>  
</networkConnectors>

- 常用参数
  duplex="true” :	  
    
  conduitSubscriptions="true"   
  — 默认true，是否把同一个broker 的多个consumer 当做一个来处理  
    
  decreaseNetworkConsumerPriority="false"  
  --- 是否降低网络消费者(Queue)的权重，默认为false

- 消息回流
  从5. 6版起，在dest i nat i onPol i cy上新增的选项r epl ayWhenNoConsumer s。这个选项使得br oker 1  
  上有需要转发的消息但是没有消费者时，把消息回流到它原始的br oker 。同时把enabl eAudi t 设置为  
  f al se，为了防止消息回流后被当做重复消息而不被分发，示例如下: <dest i nat i onPol i cy>  
  <pol i cyMap> <policyEntries>  
  <policyEntry queue=">" enableAudit="false"> <net wor kBr i dgeFi l t er Fact or y>  
  <conditionalNetworkBridgeFilterFactory replayWhenNoConsumers="true"/> </networkBridgeFilterFactory>  
   </policyEntry> </policyEntries>  
  </ pol i cyMap>  
  </ dest i nat i onPol i cy>

### 容错连接

failover:(tcp://192.168.1.106:61679,tcp://192.168.1.106:61819)?randomize=false  
  
常用参数：

### 2、动态网络连接

[multicast://ipadaddress:port?transportOptions](multicast://ipadaddress:port?transportOptions)  
  
配置示例1:默认配置，请注意，默认情况下是不可靠的多播，数据包可能会丢失  
multicast://default2:特定的ip和端口  
multicast://224.1.2.3:62553:特定的ip和端口以及组名  
multicast://224.1.2.3:6255?group=mygroupname  
  
Activemq使用multicast协议的配置格式如下  
<brokerxmlns="http://activemq.apache.org/schema/core" brokerName="multicast"  
 dataDirectory="${activemq.base}/data"><networkConnectors>  
<networkConnectorname="default-nc" uri="multicast://default"/></networkConnectors>  
<transportConnectors>  
<transportConnectorname="openwire" uri="tcp://localhost:61616" discoveryUri="multicast://default"/>  
</transportConnectors></broker>

## 集群

### 主从模式

1、Shared File System Master Slave:基于共享储存的Master-Slave:多个broker实例使用  
一个存储文件，谁拿到文件锁就是master，其他处于待启动状态，如果master挂掉了，某  
个抢到文件锁的slave变成master  
  
2、JDBCMasterSlave:  
基于JDBC的Master-Slave:使用同一个数据库，拿到LOCK表的写锁的  
broker成为master  
  
3、ReplicatedLevelDBStore:  
基于ZooKeeper复制LevelDB存储的Master-Slave机制，这个  
是5.9新加的  
  
使用<jdbcPersistenceAdapter />来配置消息的持久化，自动就会使用JDBCMasterSlave的方式。  
 

## 问题

### 同步异步

### 消息积压

### 消息丢失

消息中间件持久化存储到磁盘中，理论上消息不会丢失（由消息中间件保证），所以确认回复消息后，消息生产者才能确定消息发送成功。因此会产生消息重复的情况，参照消息重复的解决方式。

### 消息重复

- 发送端应用重复发送
  消息中间件接收消息并成功存储，此时出现如下情况，导致应用端没有接收到消息发送成功的返回。  
    
  1、消息中间件宕机  
  2、消息中间件响应超时  
  3、网络连接故障  
  4、发送端应用宕机  
    
  解决方法：  
  一、重试发送消息时，使用同样的消息id，而不在消息中间件端产生消息id。ActiveMQ消息头中的消息id不建议修改，使用消息属性:  
  message.setStringProperty("MessageId", "Jane");

- 消息中间件重复投递
  接收端接收到消息，处理后，在确认消息前出现如下问题：  
  1、消费者应用宕机  
  2、网络故障  
  3、处理消息超时  
  4、消息中间件宕机  
    
  解决方法：  
  消费者应用处理消息是幂等操作。

## 异常消息

过期信息  
定期清理无效的队列  
定期自动清理无效的Topic和Queue,这个配置，只会清除设置的时间内，没有被订阅，同时队列没有遗留数据的队列。  
  
同时，对于boker节点，需要设置schedulePeriodForDestinationPurge 参数，表示多长之间执行一次检测。  
设置消息的全局过期时间  
过期的时间会进入死信，死信也会沿用此时间，到期后，系统就会自动删除信息了  
  
————————  
死信队列  
————————  
信息丢失  
---------------------  
消息积压

### 死信队列

若开启事务，则在事务提交之前处理异常，再提交事务，若不提交事务，消息不会移除  
若使用自动确认，重试**4次**后仍然异常消息移动到死信队列中  
---------------------   
如果你想在消息处理失败后，不被服务器删除，还能被其他消费者处理或重试，可以关闭AUTO_ACKNOWLEDGE，将ack交由程序自己处理。那如果使用了AUTO_ACKNOWLEDGE，消息是什么时候被确认的，还有没有阻止消息确认的方法？有！  
  
消费消息有2种方法，一种是调用consumer.receive()方法，该方法将阻塞直到获得并返回一条消息。这种情况下，消息返回给方法调用者之后就自动被确认了。另一种方法是采用listener回调函数，在有消息到达时，会调用listener接口的onMessage方法。在这种情况下，在onMessage方法执行完毕后，消息才会被确认，此时只要在方法中抛出异常，该消息就不会被确认。那么问题来了，如果一条消息不能被处理，会被退回服务器重新分配，如果只有一个消费者，该消息又会重新被获取，重新抛异常。就算有多个消费者，往往在一个服务器上不能处理的消息，在另外的服务器上依然不能被处理。难道就这么退回--获取--报错死循环了吗？  
  
在重试6次后，ActiveMQ认为这条消息是“有毒”的，将会把消息丢到死信队列里。如果你的消息不见了，去ActiveMQ.DLQ里找找，说不定就躺在那里。

- 
![](assets/23A6852C-A6D8-42B5-A050-8EBB913AE64F.png)

	- 
![](assets/09BA264F-889C-499F-BA3F-C8924819E2AE.png)

## 优化

## Consumer高级特性

### Exclusive Consumer

独有消费者(ExclusiveConsumer)  
Queue中的消息是按照顺序被分发到consumers的。然而，当你有多个consumers同时  
从相同的queue中提取消息时，你将失去这个保证。因为这些消息是被多个线程并发的处理。有的时候，保证消息按照顺序处理是很重要的。例如，你可能不希望在插入订单操作结束之前执行更新这个订单的操作。  
ActiveMQ从4.x版本起开始支持ExclusiveConsumer。Broker会从多个consumers中挑选一个consumer来处理queue中所有的消息，从而保证了消息的有序处理。如果这个consumer失效，那么broker会自动切换到其它的consumer。可以通过Destination  
Options来创建一个ExclusiveConsumer，如下:  
queue=newActiveMQQueue("TEST.QUEUE?consumer.exclusive=true");  
consumer=session.createConsumer(queue);还可以给consumer设置优先级，以便针对网络情况进行优化，如下:  
queue=new  
ActiveMQQueue("TEST.QUEUE?consumer.exclusive=true&consumer.priority=10");

### Consumer Dispatche Async

在act i vemq4. 0以后，你可以选择br oker 同步或异步的把消息分发给消费者。可以设置 di spat chAsync 属性，默认是t r ue，通常情况下这是最佳的

### Consumer Priority

JMS JMSPriority 定义了十个消息优先级值，0 是最低的优先级，9 是最高的优先级。另 外，客户端应当将0‐4 看作普通优先级，5‐9 看作加急优先级。

### Manage Durable Subscribers

消息的持久化，保证了消费者离线后，再次进入系统，不会错过消息，但是这也会消耗很多的资源。从5.6开始，可以对持久化消息进行如下管理:  
Removinginactivesubscribers  
我们还可能希望删除那些不活动的订阅者，如下:  
<brokername="localhost"offlineDurableSubscriberTimeout="86400000"offlineDurableSubscriberTaskSchedule="3600000">  
1:offlineDurableSubscriberTimeout:离线多长时间就过期删除，缺省是-1，就是不删除2:offlineDurableSubscriberTaskSchedule:多长时间检查一次，缺省300000，单位毫秒

### Message Groups

MessageGroups就是对消息分组，它是ExclusiveConsumer功能的增强:逻辑上，MessageGroups可以看成是一种并发的ExclusiveConsumer。跟所有的消  
息都由唯一的consumer处理不同，JMS消息属性JMSXGroupID被用来区分messagegroup。MessageGroups特性保证所有具有相同JMSXGroupID的消息会被分发到相同的consumer(只要这个consumer保持active)。  
另外一方面，MessageGroups特性也是一种负载均衡的机制。在一个消息被分发到consumer之前，broker首先检查消息JMSXGroupID属性。如果存在，那么broker会检查是否有某个consumer拥有这个messagegroup。如果没有，那么broker会选择一个consumer，并将它关联到这个messagegroup。此后，这个consumer会接收这个messagegroup的所有消息，直到:  
1:Consumer被关闭  
2:Messagegroup被关闭，通过发送一个消息，并设置这个消息的JMSXGroupSeq为-1  
创建一个MessageGroups，只需要在message对象上设置属性即可，如下:message.setStringProperty("JMSXGroupID","GroupA")  
  
关闭一个MessageGroups，只需要在message对象上设置属性即可，  
如下:message.setStringProperty("JMSXGroupID","GroupA");  
message.setIntProperty("JMSXGroupSeq",-1);

### Message Selectors

MSSelectors用在获取消息的时候，可以基于消息属性和Xpath语法对消息进行过滤。JMSSelectors由SQL92语义定义。以下是个Selectors的例子:  
consumer=session.createConsumer(destination,"JMSType='car'ANDweight>2500");1:JMSSelectors表达式中，可以使用IN、NOTIN、LIKE等  
2:需要注意的是，JMSSelectors表达式中的日期和时间需要使用标准的long型毫秒值3:表达式中的属性不会自动进行类型转换，例如:  
myMessage.setStringProperty("NumberOfOrders","2");那么此时“NumberOfOrders>1”求值结果会是false  
4:MessageGroups虽然可以保证具有相同messagegroup的消息被唯一的consumer顺序处理，但是却不能确定被哪个consumer处理。在某些情况下，MessageGroups可以和JMSSelector一起工作，  
例如:设想有三个consumers分别是A、B和C。你可以在producer中为消息设置三个messagegroups分别是“A”、“B”和“C”。然后令consumerA使用“JMXGroupID=‘A’”作为selector。B和C也同理。这样就可以保证messagegroupA的消息只被consumerA处理。需要注意的是，这种做法有以下缺点:  
(1)producer必须知道当前正在运行的consumers，也就是说producer和consumer被耦合到一起。(2)如果某个consumer失效，那么应该被这个consumer消费的消息将会一直被积压在broker上。

### Redelivery Policy

### SlowConsumer Handling

Prefetch机制  
ActiveMQ通过Prefetch机制来提高性能，方式是在客户端的内存里可能会缓存一定  
数量的消息。缓存消息的数量由prefetchlimit来控制。当某个consumer的prefetch  
buffer已经达到上限，那么broker不会再向consumer分发消息，直到consumer向broker发送消息的确认，确认后的消息将会从缓存中去掉。  
可以通过在ActiveMQConnectionFactory或者ActiveMQConnection上设置  
ActiveMQPrefetchPolicy对象来配置prefetchpolicy。也可以通过connectionoptions或者destinationoptions来配置。例如:  
tcp://localhost:61616?jms.prefetchPolicy.all=50  
tcp://localhost:61616?jms.prefetchPolicy.queuePrefetch=1  
queue=newActiveMQQueue("TEST.QUEUE?consumer.prefetchSize=10");  
prefetchsize的缺省值如下:  
1:persistentqueues(defaultvalue:1000)  
2:non-persistentqueues(defaultvalue:1000)  
3:persistenttopics(defaultvalue:100)  
4:non-persistenttopics(defaultvalue:Short.MAX_VALUE-1)

## Message高级特性

### Message Properties

常见的一些属性说明  
1:Queue的消息默认是持久化的  
2:消息的优先级默认是4  
3:消息发送时设置了时间戳  
4:消息的过期时间默认是永不过期，过期的消息进入DLQ，可以配置DLQ及其处理策略  
5:如果消息时重发的，将会标记出来  
6:JMSReplyTo标识响应消息发送到哪个Queue  
7:JMSCorelationID标识此消息相关联的消息id，可以用这个标识把多个消息连接起来  
8:JMS同时也记录了消息重发的次数，默认是6次  
9:如果有一组关联的消息需要处理，可以分组:只需要设置消息组的名字和这个消息是第几  
个消息  
10:如果消息中一个事务环境，则TXID将被设置  
11:此外ActiveMQ在服务器端额外设置了消息入列和出列的时间戳  
12:ActiveMQ里消息属性的值，不仅可以用基本类型，还可以用List或Map类型

### Advisory Message

支持获取如下信息:  
1:consumers,producers和connections的启动和停止  
2:创建和销毁temporarydestinations  
3:topics和queues的消息过期  
4:brokers发送消息给destinations，但是没有consumers5:connections启动和停止  
几点说明:  
1:所有Advisory的topic，前缀是:ActiveMQ.Advisory  
2:所有Advisory的消息类型是:‘Advisory’，所有的Advisory都有的消息属性有:originBrokerId、  
originBrokerName、originBrokerURL  
3:具体支持的topic和queue，请参看http://activemq.apache.org/advisory-message.html  
打开Advisories，默认Advisory的功能是关闭的

### 延迟和定时消息投递

延迟和定时消息投递(DelayandScheduleMessageDelivery)  
有时候我们不希望消息马上被broker投递出去，而是想要消息60秒以后发给消费者，或者我们想  
让消息没隔一定时间投递一次，一共投递指定的次数。。。类似这种需求，ActiveMQ提供了一种broker端消息定时调度机制。  
我们只需要把几个描述消息定时调度方式的参数作为属性添加到消息，broker端的调度器就会按照我们想要的行为去处理消息。当然需要在xml中配置schedulerSupport属性为true  
  
一共有4个属性  
1:AMQ_SCHEDULED_DELAY:延迟投递的时间  
2:AMQ_SCHEDULED_PERIOD:重复投递的时间间隔  
3:AMQ_SCHEDULED_REPEAT:重复投递次数  
4:AMQ_SCHEDULED_CRON:Cron表达式

### Blob Messages

### Message Transformation

有时候需要在JMSprovider内部进行message的转换。从4.2版本起，ActiveMQ提供了一个MessageTransformer接口用于进行消息转换，可以在如下对象上调用:  
ActiveMQConnectionFactory、ActiveMQConnection、ActiveMQSession、ActiveMQMessageConsumer、ActiveMQMessageProducer  
在消息被发送到JMSprovider的消息总线前进行转换。通过producerTransform方法  
在消息到达消息总线后，但是在consumer接收到消息前进行转换。通过consumerTransform方法  
当然MessageTransformer接口的实现，需要你自己来提供

## Message Dispatch高级特性

### Message Cursors

从Act i veMQ5. 0. 0版本开始，消息发送系统采用一种混合型的发送模式，当消息消费者处 理活跃状态时，允许消息发送系统直接把持久消息发送给消费者，当消费者处于不活跃状态下，切换使 用Cur sor s来处理消息的发送。  
  
Message Cursors分成三种类型   
1:Store-based  
2:VM  
3:File-based

### Async Sends

- What
  AciveMQ支持异步和同步发送消息，是可以配置的。通常对于快的消费者，  
  是直接把消息同步发送过去，但对于一个Sl ow Consumer，你使用同步发送消息 可能出现Pr oducer 堵塞等现象，慢消费者适合使用异步发送

- How
  配置使用  
  1:ActiveMQ默认设置dispatcheAsync=true是最好的性能设置。  
  如果你处理的是FastConsumer则使用dispatcheAsync=false  
  2:在ConnectionURI级别来配置使用AsyncSend  
  cf=newActiveMQConnectionFactory("tcp://locahost:61616?jms.useAsyncSend=true");  
  3:在ConnectionFactory级别来配置使用AsyncSend  
  ((ActiveMQConnectionFactory)connectionFactory).setUseAsyncSend(true);  
  4:在Connection级别来配置使用AsyncSend  
  ((ActiveMQConnection)connection).setUseAsyncSend(true);

### Dispatch Policies

- 严格顺序分发策略(Strict Order Dispatch Policy)

- 轮询分发策略(Round Robin Dispatch Policy)

### Optimized Acknowledgement

批量确认消息

### Producer FlowControl

生产者流量控制(ProducerFlowControl)流量控制的含义:当生产者产生消息过快，超过流量限制的时候，生产者将会被阻  
塞直到资源可以继续使用，或者抛出一个JMSException，可以通过<systemUsage>来配置。同步发送消息的producer会自动使用producerflowcontrol;对于异步发送消息的producer，要使用producerflowcontrol，你先要为connection配置一个  
ProducerWindowSize参数，如下:  
((ActiveMQConnectionFactory)cf).setProducerWindowSize(1024000);  
ProducerWindowSize是producer在发送消息的过程中，收到broker对于之前发送消  
息的确认之前，能够发送消息的最大字节数

## Destination高级特性

### Wildcards

ActiveMQ支持以下三种wildcards:  
1:“. ” 用于作为路径上名字间的分隔符  
2:“*” 用于匹配路径上的任何名字  
3:">" 用于递归地匹配任何以这个名字开始的destination  
  
示例：  
1:PRICE.>:匹配任何产品的价格变动  
2:PRICE.STOCK.>:匹配任何产品的股票价格变动  
3:PRICE.STOCK.NASDAQ.*:匹配任何在NASDAQ下面的产品的股票价格变动  
4:PRICE.STOCK.*.IBM:匹配任何IBM的产品的股票价格变动  
客户化路径分隔符，比如你想要用“/”来替换“.”<plugins>  
<destinationPathSeparatorPlugin/></plugins>

### Composite Destinations

组合队列允许用一个虚拟的destination代表多个destinations。这样就可以通过composite  
destinations在一个操作中同时向多个queue发送消息。  
1:客户端实现的方式  
在composite destinations中，多个destination之间采用“,”分割。例如:  
Queue queue=new ActiveMQQueue("FOO.A,FOO.B,FOO.C");  
如果你希望使用不同类型的destination，那么需要加上前缀如queue://或topic://，  
例如:Queue queue=new ActiveMQQueue("FOO.A,topic://NOTIFY.FOO.A");  
  
2:在xml配置实现的方式  
<destinationInterceptors>  
	<virtualDestinationInterceptor>  
		<virtualDestinations>  
			<compositeQueuename="MY.QUEUE">  
				<forwardTo>  
					<queuephysicalName="my-queue"/>  
					<queuephysicalName="my-queue2"/></forwardTo>  
			</compositeQueue>  
		</virtualDestinations>  
	</virtualDestinationInterceptor>  
</destinationInterceptors>  
  
3:使用filtered destinations，在xml配置实现的方式  
<destinationInterceptors>  
	<virtualDestinationInterceptor>  
		<virtualDestinations>  
			<compositeQueuename="MY.QUEUE">  
				<forwardTo>  
					<filteredDestinationselector="odd='yes'"queue="FOO"/>  
					<filteredDestinationselector="i=5"topic="BAR"/>  
				</forwardTo>  
			</compositeQueue>  
		</virtualDestinations>  
	</virtualDestinationInterceptor>  
</destinationInterceptors>  
  
4:避免在network连接broker中，出现重复消息  
<networkConnectors>  
	<networkConnector uri="static://(tcp://localhost:61617)">  
		<excludedDestinations>  
			<queuephysicalName="Consumer.*.VirtualTopic.>"/>  
		</excludedDestinations>  
	</networkConnector>  
</networkConnectors>

### Configure Startup Destinations

Configure Startup Destinations  
  
如果需要在ActiveMQ启动的时候，创建Destination的话，可以如下配置:  
  
<broker xmlns="http://activemq.apache.org/schema/core">  
<destinations>  
	<queue physicalName="FOO.BAR"/>  
	<topic physicalName="SOME.TOPIC"/>  
</destinations>  
</broker>

### Delete Inactive Destinations

一般情况下，ActiveMQ的queue在不使用之后，可以通过web控制台或是JMX方式来删除掉。当  
然，也可以通过配置，使得broker可以自动探测到无用的队列(一定时间内为空的队列)并删除掉，回  
收响应资源。  
可以如下配置:  
<broker xmlns="http://activemq.apache.org/schema/core" schedulePeriodForDestinationPurge="10000">  
<destinationPolicy>  
	<policyMap>  
		<policyEntries>  
			<policyEntry queue=">"gcInactiveDestinations="true" inactiveTimoutBeforeGC="30000"/>  
		</policyEntries>  
	</policyMap>  
</destinationPolicy>  
</broker>  
  
说明:  
schedulePeriodForDestinationPurge:设置多长时间检查一次，这里是10秒，默认为0  
inactiveTimoutBeforeGC:设置当Destination为空后，多长时间被删除，这里是30秒，默认为60  
gcInactiveDestinations:设置删除掉不活动队列，默认为false

### Destination Options

使用示例:  
queue = new ActiveMQQueue("TEST.QUEUE?consumer.dispatchAsync=false&consumer.prefetchSize=10");  
consumer=session.createConsumer(queue);

### Visual Destinations

概述  
虚拟Destinations用来创建逻辑Destinations，客户端可以通过它来生产和消费消  
息，它会把消息映射到物理Destinations。  
ActiveMQ支持两种方式:  
1:虚拟主题(VirtualTopics)  
2:组合Destinations(CompositeDestinations)

- 为何使用
  为何使用虚拟主题  
  ActiveMQ中，topic只有在持久订阅下才是持久化的。持久订阅时，每个持久订阅  
  者，都相当于一个queue的客户端，它会收取所有消息。  
  这种情况下存在两个问题:  
  1:同一应用内consumer端负载均衡的问题:也即是同一个应用上的一个持久订阅不能使用多  
  个consumer来共同承担消息处理功能。因为每个consumer都会获取所有消息。queue模式可以解决这个问题，但broker端又不能将消息发送到多个应用端。所以，  
  既要发布订阅，又要让消费者分组，这个功能JMS规范本身是没有的。  
  2:同一应用内consumer端failover的问题:由于只能使用单个的持久订阅者，如果这个订阅  
  者出错，则应用就无法处理消息了，系统的健壮性不高为了解决这两个问题，ActiveMQ中实现了虚拟Topic的功能

- 如何使用
  如何使用虚拟主题  
    
  1:对于消息发布者来说，就是一个正常的Topic，名称以 VirtualTopic. 开头。例如  
  VirtualTopic.Orders，代码示例如下:  
  Topicdestination=session.createTopic("VirtualTopic.Orders");  
  2:对于消息接收端来说，是个队列，不同应用里使用不同的前缀作为队列的名称，即可表明自己的身份即可实现消费端应用分组。  
    
  例如Consumer.A.VirtualTopic.Orders，说明它是名称为A的消费端，同理Consumer.B.VirtualTopic.Orders说明是一个名称为B的客户端。可以在同一个应用里使用多个consumer消费此queue，则可以实现上面两个功能。  
  又因为不同应用使用的queue名称不同(前缀不同)，所以不同的应用中都可以接收到全部的消息。每个客户端相当于一个持久订阅者，而且这个客户端可以使用多个消费者共同来承担消费任务。  
    
  代码示例如下:  
  Destinationdestination=session.createQueue("Consumer.A.VirtualTopic.Orders");  
    
    
  3:  
  默认虚拟主题的前缀是 :VirtualTopic.>   
  自定义消费虚拟地址默认格式:Consumer.*.VirtualTopic.> 自定义消费虚拟地址可以改，比如下面的配置就把它修改了。  
    
  自定义VirtualTopic。（如下配置，将所有的topic映射为VirtualTopic）  
    
  <broker xmlns="http://activemq.apache.org/schema/core">    
    <destinationInterceptors>    
      <virtualDestinationInterceptor>    
        <virtualDestinations>    
          <virtualTopic name=">" prefix="Consumer.*." selectorAware="false"/>    
        </virtualDestinations>    
      </virtualDestinationInterceptor>    
    </destinationInterceptors>    
  </broker>  

### Mirrored Queues

- What
  概述  
  ActiveMQ中每个queue中的消息只能被一个consumer消费。然而，有时候你可能希望  
  能够监视生产者和消费者之间的消息流。你可以通过使用VirtualDestinations来建立一个virtualqueue来把消息转发到多个queues中。但是为系统中每个queue都进行如此的配置可能会很麻烦。

- How
      ActiveMQ支持MirroredQueues。Broker会把发送到某个queue的所有消息转发到一个名称类似的topic，因此监控程序只需要订阅这个mirroredqueuetopic。为了启用MirroredQueues，首先要将BrokerService的useMirroredQueues属性设置成true，然后可以通过destinationInterceptors设置其它属性，如mirrortopic的前缀，缺省是 “VirtualTopic.Mirror.”。  
    
  比如修改后缀的配置示例如下:  
  <destinationInterceptors>  
  	<mirroredQueuecopyMessage="true" postfix=".qmirror" prefix=""/>  
  </destinationInterceptors>

### Per Destination Policies

