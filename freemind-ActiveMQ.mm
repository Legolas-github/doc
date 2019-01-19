<map version="1.0.0"><node ID="A71C971A-0698-4D48-86B5-CD6E21F1D4CD" BACKGROUND_COLOR="#FFFFFF" TEXT="ActiveMQ" COLOR="#4A4A49" POSITION="right" STYLE="bubble"><edge COLOR="#4B4B4B" WIDTH="4" /><font NAME="PingFangSC-Regular" SIZE="24" /><node ID="6C1988DA-A4B2-408B-AEFA-C537373ADCD1" TEXT="&#24341;&#20837;" COLOR="#6D6C6C" POSITION="right" STYLE="fork"><edge COLOR="#72C8FF" WIDTH="6" /><font NAME="PingFangSC-Regular" SIZE="20" /><node ID="3CE05EDB-2927-49E5-8B44-7F7426788E45" TEXT="What" COLOR="#6D6C6C" POSITION="right" STYLE="fork"><edge COLOR="#72C8FF" WIDTH="5" /><font NAME="Helvetica" SIZE="20" /><node ID="27CC61A5-FB06-4093-9D92-5B3D30DBD639" TEXT="&#23450;&#20041;" COLOR="#6D6C6C" POSITION="right" STYLE="fork"><edge COLOR="#72C8FF" WIDTH="4" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>ActiveMQ</span><span>是一个</span><span>MOM</span><span>，具体来说是一个实现了</span><span>JMS</span><span>规范的系统间远程通信的消息代理。</span></p></body>
</html>
</richcontent>
</node>
<node ID="BF1F948D-6330-402B-9976-F84ACF7B3565" TEXT="MOM" COLOR="#6D6C6C" POSITION="right" STYLE="fork"><edge COLOR="#72C8FF" WIDTH="4" /><font NAME="Helvetica" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>MOM</span><span>：面向消息中间件（</span><span>Message oriented middleware</span><span>），是用于以分布式应用或系统中的异步、松耦合、可靠、可扩展和安全通信的一类软件。</span><span>MOM </span><span>的总体思想是它作为消息发送器和消息接收器之间的消息中介</span><span>,</span><span>这种中介提供了一个全新水平的松耦合。</span></p></body>
</html>
</richcontent>
</node>
<node ID="9B9C31AD-8CA0-43EB-9068-F7C1358F65CC" TEXT="JMS" COLOR="#6D6C6C" POSITION="right" STYLE="fork"><edge COLOR="#72C8FF" WIDTH="4" /><font NAME="Helvetica" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>JMS</span><span>即</span><span>Java</span><span>消息服务（</span><span>Java Message Service</span><span>）应用程序接口，是一个</span><span>Java</span><span>平台中关于面向消息中间件（</span><span>MOM</span><span>）的</span><span>API</span><span>，用于在两个应用程序之间，或分布式系统中发送消息，进行异步通信</span></p></body>
</html>
</richcontent>
</node>
</node>
<node ID="7AF337E1-AD27-4A20-89E9-04E8F6299C15" TEXT="Why" COLOR="#6D6C6C" POSITION="right" STYLE="fork"><edge COLOR="#72C8FF" WIDTH="5" /><font NAME="Helvetica" SIZE="20" /></node>
<node ID="917F84D3-1C6F-43F9-B5DB-B4B2ED9D87F3" TEXT="When" COLOR="#6D6C6C" POSITION="right" STYLE="fork"><edge COLOR="#72C8FF" WIDTH="5" /><font NAME="Helvetica" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span> </span><span>异步调用</span></p><p><span>一对多通信</span><span> </span></p><p><span>做多个系统的集成，同构、异构</span><span> </span></p><p><span>作为</span><span>RPC</span><span>的替代</span><span> </span></p><p><span>多个应用相互解耦</span><span> </span></p><p><span>作为事件驱动架构的幕后支撑</span><span> </span></p><p>为了提高系统的可伸缩性</p></body>
</html>
</richcontent>
</node>
<node ID="85CDF50E-A7F8-41D7-9E3B-08DA4FF86EC2" TEXT="How" COLOR="#6D6C6C" POSITION="right" STYLE="fork"><edge COLOR="#72C8FF" WIDTH="5" /><font NAME="Helvetica" SIZE="20" /><node ID="2EC10A19-655D-4069-9CFA-7E8CD3A6D48E" TEXT="&#36890;&#29992;&#27493;&#39588;" COLOR="#6D6C6C" POSITION="right" STYLE="fork"><edge COLOR="#72C8FF" WIDTH="4" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p>获取连接工厂</p><p>使用连接工厂创建连接</p><p>启动连接</p><p>从连接创建会话</p><p><span>获取</span><span> Destination</span></p><p><span>创建</span><span> Producer</span><span>，或</span></p><p><span>创建</span><span> Producer</span></p><p><span>创建</span><span> message</span></p><p><span>创建</span><span> Consumer</span><span>，或发送或接收</span><span>message</span><span>发送或接收</span><span> message</span></p><p><span>创建</span><span> Consumer</span></p><p>注册消息监听器（可选）</p><p><span>发送或接收</span><span> message</span></p><p><span>关闭资源（</span><span>connection, session, producer, consumer </span><span>等</span><span>)</span></p></body>
</html>
</richcontent>
</node>
<node ID="5E937197-A922-4A49-9C0C-BDF12F157EE5" TEXT="&#20195;&#30721;&#31034;&#20363;" COLOR="#6D6C6C" POSITION="right" STYLE="fork"><edge COLOR="#72C8FF" WIDTH="4" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p>public class JMSDemo {</p><p>        ConnectionFactory connectionFactory;</p><p>        Connection connection;</p><p>        Session session;</p><p>        Destination destination;</p><p>        MessageProducer producer;</p><p>        MessageConsumer consumer;</p><p>        Message message;</p><p>        boolean useTransaction = false;</p><p>        try {</p><p>                Context ctx = new InitialContext();</p><p>                connectionFactory = (ConnectionFactory) ctx.lookup(&quot;ConnectionFactoryName&quot;);</p><p><span>                //</span><span>使用</span><span>ActiveMQ</span><span>时：</span><span>connectionFactory = new ActiveMQConnectionFactory(user, password, getOptimizeBrokerUrl(broker));</span></p><p>                connection = connectionFactory.createConnection();</p><p>                connection.start();</p><p>                session = connection.createSession(useTransaction, Session.AUTO_ACKNOWLEDGE);</p><p>                destination = session.createQueue(&quot;TEST.QUEUE&quot;);</p><p><span>                //</span><span>生产者发送消息</span></p><p>                producer = session.createProducer(destination);</p><p>                message = session.createTextMessage(&quot;this is a test&quot;);</p><p></p><p><span>                //</span><span>消费者同步接收</span></p><p>                consumer = session.createConsumer(destination);</p><p>                message = (TextMessage) consumer.receive(1000);</p><p>                System.out.println(&quot;Received message: &quot; + message);</p><p><span>                //</span><span>消费者异步接收</span></p><p>                consumer.setMessageListener(new MessageListener() {</p><p>                        @Override</p><p>                        public void onMessage(Message message) {</p><p>                                if (message != null) {</p><p>                                        doMessageEvent(message);</p><p>                                }</p><p>                        }</p><p>                });</p><p>        } catch (JMSException e) {</p><p>                ...</p><p>        } finally {</p><p>                producer.close();</p><p>                session.close();</p><p>                connection.close();</p><p>        }</p><p>}</p></body>
</html>
</richcontent>
</node>
</node>
</node>
<node ID="308AA3A7-EC01-484A-910D-BE1407FC881B" TEXT="&#22522;&#26412;&#27010;&#24565;" COLOR="#6D6C6C" POSITION="right" STYLE="fork"><edge COLOR="#FF9559" WIDTH="6" /><font NAME="PingFangSC-Regular" SIZE="20" /><node ID="EF90C641-6F58-4665-8131-8E42005DAD88" TEXT="Provider" COLOR="#6D6C6C" POSITION="right" STYLE="fork"><edge COLOR="#FF9559" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p>实现JMS接口和规范的消息中间件</p></body>
</html>
</richcontent>
</node>
<node ID="1B7656D6-C4AA-4164-92C9-9D9C66BF67DE" TEXT="Domains" COLOR="#6D6C6C" POSITION="right" STYLE="fork"><edge COLOR="#FF9559" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>消息传递方式，包括点对点（</span><span>P2P</span><span>）、发布</span><span>/</span><span>订阅（</span><span>Pub/Sub</span><span>）两种</span></p></body>
</html>
</richcontent>
<node ID="FDF0D838-1BB9-4288-BCE0-ED3BDE1F71DA" TEXT="P2P" COLOR="#6D6C6C" POSITION="right" STYLE="fork"><edge COLOR="#FF9559" WIDTH="4" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>P2P </span><span>（点对点）消息域使用</span><span> queue </span><span>作为</span><span> Destination</span><span>，消息可以被同步或异步的发送和接收，每个消息只会给一个</span><span> Consumer </span><span>传送一次。</span></p><p></p><p><span>Consumer </span><span>可以使用</span><span> MessageConsumer.receive() </span><span>同步地接收消息，也可以通过使用</span><span>MessageConsumer.setMessageListener() </span><span>注册一个</span><span> MessageListener </span><span>实现异步接收。</span></p><p></p><p>多个 Consumer 可以注册到同一个 queue 上，但一个消息只能被一个 Consumer 所接收，然后由该 Consumer 来确认消息。并且在这种情况下，Provider 对所有注册的 Consumer 以轮询的方式发送消息。</p></body>
</html>
</richcontent>
</node>
<node ID="9FDCDEB1-95B0-41CA-865D-0D3B67F947FB" TEXT="Pub/Sub" COLOR="#6D6C6C" POSITION="right" STYLE="fork"><edge COLOR="#FF9559" WIDTH="4" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>Pub/Sub</span><span>（发布</span><span>/</span><span>订阅，</span><span>Publish/Subscribe</span><span>）消息域使用</span><span> topic </span><span>作为</span><span> Destination</span><span>，发布者向</span><span> topic </span><span>发送消息，订阅者注册接收来自</span><span> topic </span><span>的消息。发送到</span><span> topic </span><span>的任何消息都将自动传递给所有订阅者。接收方式（同步和异步）与</span><span> P2P </span><span>域相同。</span></p><p></p><p><span>除非显式指定，否则</span><span> topic </span><span>不会为订阅者保留消息。当然，这可以通过持久化（</span><span>Durable</span><span>）订阅来实现消息的保存。这种情况下，当订阅者与</span><span> Provider </span><span>断开时，</span><span>Provider </span><span>会为它存储消息。当持久化订阅者重新连接时，将会受到所有的断连期间未消费的消息。</span></p></body>
</html>
</richcontent>
</node>
<node ID="50F724E5-154F-42DB-920A-119CFED3BEC9" TEXT="" COLOR="#6D6D6D" POSITION="right" STYLE="fork"><edge COLOR="#FF9559" WIDTH="4" /><font NAME="PingFangSC-Regular" SIZE="20" /></node>
</node>
<node ID="E01C9D2B-E6B2-44B7-BD01-77FD4372EF9F" TEXT="Connection Factory" COLOR="#6D6C6C" POSITION="right" STYLE="fork"><edge COLOR="#FF9559" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>客户端使用连接工厂来创建与</span><span> JMS provider </span><span>的连接</span></p></body>
</html>
</richcontent>
</node>
<node ID="BB4EDEFB-A0EE-46F2-A842-AF5C6AD37B41" TEXT="Destination" COLOR="#6D6C6C" POSITION="right" STYLE="fork"><edge COLOR="#FF9559" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p>消息被寻址、发送以及接收的对象</p></body>
</html>
</richcontent>
</node>
</node>
<node ID="16CA162F-D27E-40C4-B342-ECA74D632EDA" TEXT="&#25903;&#25345;&#30340;&#20256;&#36755;&#21327;&#35758;" COLOR="#6D6B6C" POSITION="right" STYLE="fork"><edge COLOR="#AF4FC8" WIDTH="6" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>1</span><span>、</span><span>TCP</span></p><p><span>2</span><span>、</span><span>NIO</span></p><p><span>3</span><span>、</span><span>UDP</span></p><p><span>4</span><span>、</span><span>SSL</span></p><p><span>5</span><span>、</span><span>HTTP</span></p><p><span>6</span><span>、</span><span>VM</span></p></body>
</html>
</richcontent>
</node>
<node ID="11174144-82F2-4093-8B4A-59443EA7F015" TEXT="&#28040;&#24687;&#30340;&#23384;&#20648;&#26041;&#24335;" COLOR="#6D6B6C" POSITION="right" STYLE="fork"><edge COLOR="#FFCD3B" WIDTH="6" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>1</span><span>、</span><span>KahaDB</span></p><p><span>2</span><span>、</span><span>AMQ</span></p><p><span>3</span><span>、</span><span>JDBC</span></p><p><span>4</span><span>、</span><span>Memory</span></p></body>
</html>
</richcontent>
</node>
<node ID="6C2A2B25-ECD1-414B-A82E-D2E46359541B" TEXT="&#21333;&#26426;&#38598;&#32676;" COLOR="#6D6B6C" POSITION="right" STYLE="fork"><edge COLOR="#FF5E69" WIDTH="6" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p>步骤如下:</p><p>1、把整个conf文件夹复制一份，比如叫做conf2</p><p></p><p>2、修改里面的activemq.xml文件 </p><p>(1)里面的brokerName不能跟原来的重复 </p><p>(2)数据存放的文件名称不能重复，比如:</p><p>&lt; kahaDB directory = &quot; ${ activemq.data } / kahadb_2 &quot; / &gt; </p><p>(3)所有涉及的transportConnectors的端口，都要跟前面的不一样</p><p></p><p>3、修改jetty. xml ，主要就是修改端口，比如:</p><p>&lt;propertyname=“port ” value=“8181”/ &gt; 端口必须和前面的不一样</p><p></p><p>4、到bin下面，复制一个activemq，比如叫做activemq2: </p><p>(1)修改程序的id，不能和前面的重复</p><p>ACTIVEMQ_PIDFILE=&quot;$ACTIVEMQ_DATA/ activemq2- ` hostname` . pid&quot; </p><p>(2)修改配置文件路径</p><p>ACTIVEMQ_CONF=&quot;$ACTIVEMQ_BASE/ conf2&quot;</p><p>(3)修改端口，里面有个tcp的61616的端口，要改成不一样的，最好跟activemq. xml里面的tcp的端口一致 </p><p>(4)然后就可以执行了，如果执行没有权限的话，就授权:chmod751activemq2</p><p> </p></body>
</html>
</richcontent>
</node>
<node ID="08AF0D43-8C7B-4FE2-9B76-14B39CEAB24A" TEXT="&#32593;&#32476;&#36830;&#25509;" COLOR="#6D6B6C" POSITION="right" STYLE="fork"><edge COLOR="#64C8CD" WIDTH="6" /><font NAME="PingFangSC-Regular" SIZE="20" /><node ID="C2D560F3-F110-47AD-8ACC-4ADEED57E254" TEXT="1&#12289;&#38745;&#24577;&#32593;&#32476;&#36830;&#25509;" COLOR="#6D6B6C" POSITION="right" STYLE="fork"><edge COLOR="#64C8CD" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p>&lt;net wor kConnect or s&gt;</p><p>&lt;networkConnector name=&quot;local network&quot;</p><p>uri=&quot;static://(tcp://remotehost1:61616,tcp://remotehost2:61616)&quot;/&gt; &lt;/ net wor kConnect or s&gt;</p><p> </p><p></p><p>=====================</p><p></p><p></p><p>&lt;networkConnectors&gt;</p><p><span>　　　　</span><span>&lt;networkConnector uri=&quot;static://(tcp://remotehost:61617)&quot;</span></p><p>                              name=&quot;queues_only&quot;</p><p>                              duplex=&quot;true&quot;</p><p><span>　　　　　　　　</span><span>&lt;excludedDestinations&gt;</span></p><p><span>　　　　　　　　　　　　</span><span>&lt;topic physicalName=&quot;&gt;&quot;/&gt;</span></p><p><span>　　　　　　　　</span><span>&lt;/excludedDestinations&gt;</span></p><p><span>　　　　</span><span>&lt;/networkConnector&gt;</span></p><p><span>　　　　</span><span>&lt;networkConnector uri=&quot;static://(tcp://remotehost:61617)&quot;</span></p><p>                              name=&quot;topics_only&quot;</p><p>                              duplex=&quot;true&quot;</p><p><span>　　　　　　　　</span><span>&lt;excludedDestinations&gt;</span></p><p><span>　　　　　　　　　　　　</span><span>&lt;queue physicalName=&quot;&gt;&quot;/&gt;</span></p><p><span>　　　　　　　　</span><span>&lt;/excludedDestinations&gt;</span></p><p><span>　　　　</span><span>&lt;/networkConnector&gt;</span></p><p>&lt;/networkConnectors&gt;</p></body>
</html>
</richcontent>
<node ID="923587ED-19E1-46DC-A73D-ADC01E69C2DD" TEXT="&#24120;&#29992;&#21442;&#25968;" COLOR="#6D6B6C" POSITION="right" STYLE="fork"><edge COLOR="#64C8CD" WIDTH="4" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p>duplex=&quot;true” :	</p><p></p><p>conduitSubscriptions=&quot;true&quot; </p><p><span>— </span><span>默认</span><span>true</span><span>，是否把同一个</span><span>broker </span><span>的多个</span><span>consumer </span><span>当做一个来处理</span></p><p></p><p>decreaseNetworkConsumerPriority=&quot;false&quot;</p><p><span>--- </span><span>是否降低网络消费者</span><span>(Queue)</span><span>的权重，默认为</span><span>false</span></p></body>
</html>
</richcontent>
</node>
<node ID="259FAECF-A923-40E7-9ED8-A2019E3871D9" TEXT="&#28040;&#24687;&#22238;&#27969;" COLOR="#6D6B6C" POSITION="right" STYLE="fork"><edge COLOR="#64C8CD" WIDTH="4" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>从</span><span>5. 6</span><span>版起，在</span><span>dest i nat i onPol i cy</span><span>上新增的选项</span><span>r epl ayWhenNoConsumer s</span><span>。这个选项使得</span><span>br oker 1</span></p><p><span>上有需要转发的消息但是没有消费者时，把消息回流到它原始的</span><span>br oker </span><span>。同时把</span><span>enabl eAudi t </span><span>设置为</span></p><p><span>f al se</span><span>，为了防止消息回流后被当做重复消息而不被分发，示例如下</span><span>: &lt;dest i nat i onPol i cy&gt;</span></p><p>&lt;pol i cyMap&gt; &lt;policyEntries&gt;</p><p>&lt;policyEntry queue=&quot;&gt;&quot; enableAudit=&quot;false&quot;&gt; &lt;net wor kBr i dgeFi l t er Fact or y&gt;</p><p>&lt;conditionalNetworkBridgeFilterFactory replayWhenNoConsumers=&quot;true&quot;/&gt; &lt;/networkBridgeFilterFactory&gt;</p><p> &lt;/policyEntry&gt; &lt;/policyEntries&gt;</p><p>&lt;/ pol i cyMap&gt;</p><p>&lt;/ dest i nat i onPol i cy&gt;</p></body>
</html>
</richcontent>
</node>
</node>
<node ID="8CB5F41D-5931-449A-82D3-FF1A9F955D08" TEXT="&#23481;&#38169;&#36830;&#25509;" COLOR="#6D6B6C" POSITION="right" STYLE="fork"><edge COLOR="#64C8CD" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p>failover:(tcp://192.168.1.106:61679,tcp://192.168.1.106:61819)?randomize=false</p><p></p><p>常用参数：</p></body>
</html>
</richcontent>
</node>
<node ID="108B83CA-7FD3-4363-A50B-50A2F3AF1773" TEXT="2&#12289;&#21160;&#24577;&#32593;&#32476;&#36830;&#25509;" COLOR="#6D6B6C" POSITION="right" STYLE="fork"><edge COLOR="#64C8CD" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p>multicast://ipadaddress:port?transportOptions</p><p></p><p><span>配置示例</span><span>1:</span><span>默认配置，请注意，默认情况下是不可靠的多播，数据包可能会丢失</span></p><p><span>multicast://default2:</span><span>特定的</span><span>ip</span><span>和端口</span></p><p><span>multicast://224.1.2.3:62553:</span><span>特定的</span><span>ip</span><span>和端口以及组名</span></p><p>multicast://224.1.2.3:6255?group=mygroupname</p><p></p><p><span>Activemq</span><span>使用</span><span>multicast</span><span>协议的配置格式如下</span></p><p>&lt;brokerxmlns=&quot;http://activemq.apache.org/schema/core&quot; brokerName=&quot;multicast&quot;</p><p> dataDirectory=&quot;${activemq.base}/data&quot;&gt;&lt;networkConnectors&gt;</p><p>&lt;networkConnectorname=&quot;default-nc&quot; uri=&quot;multicast://default&quot;/&gt;&lt;/networkConnectors&gt;</p><p>&lt;transportConnectors&gt;</p><p>&lt;transportConnectorname=&quot;openwire&quot; uri=&quot;tcp://localhost:61616&quot; discoveryUri=&quot;multicast://default&quot;/&gt;</p><p>&lt;/transportConnectors&gt;&lt;/broker&gt;</p></body>
</html>
</richcontent>
</node>
</node>
<node ID="951AFDB0-E042-43C0-8B32-D28E62139D82" TEXT="&#38598;&#32676;" COLOR="#6D6B6C" POSITION="right" STYLE="fork"><edge COLOR="#59AEE5" WIDTH="6" /><font NAME="PingFangSC-Regular" SIZE="20" /><node ID="B678EE8C-45F8-4D99-BD50-7D07A0712ECB" TEXT="&#20027;&#20174;&#27169;&#24335;" COLOR="#6D6B6C" POSITION="right" STYLE="fork"><edge COLOR="#59AEE5" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>1</span><span>、</span><span>Shared File System Master Slave:</span><span>基于共享储存的</span><span>Master-Slave:</span><span>多个</span><span>broker</span><span>实例使用</span></p><p><span>一个存储文件，谁拿到文件锁就是</span><span>master</span><span>，其他处于待启动状态，如果</span><span>master</span><span>挂掉了，某</span></p><p><span>个抢到文件锁的</span><span>slave</span><span>变成</span><span>master</span></p><p></p><p><span>2</span><span>、</span><span>JDBCMasterSlave:</span></p><p><span>基于</span><span>JDBC</span><span>的</span><span>Master-Slave:</span><span>使用同一个数据库，拿到</span><span>LOCK</span><span>表的写锁的</span></p><p><span>broker</span><span>成为</span><span>master</span></p><p></p><p><span>3</span><span>、</span><span>ReplicatedLevelDBStore:</span></p><p><span>基于</span><span>ZooKeeper</span><span>复制</span><span>LevelDB</span><span>存储的</span><span>Master-Slave</span><span>机制，这个</span></p><p><span>是</span><span>5.9</span><span>新加的</span></p><p></p><p>使用&lt;jdbcPersistenceAdapter /&gt;来配置消息的持久化，自动就会使用JDBCMasterSlave的方式。</p><p> </p></body>
</html>
</richcontent>
</node>
</node>
<node ID="7DC3AD71-E314-4A7E-A5CC-B2253F2BBC5A" TEXT="&#38382;&#39064;" COLOR="#6D6B6C" POSITION="right" STYLE="fork"><edge COLOR="#3F95CC" WIDTH="6" /><font NAME="PingFangSC-Regular" SIZE="20" /><node ID="7C08F78C-9205-4D36-BFA0-0A5AC77DEBE3" TEXT="&#21516;&#27493;&#24322;&#27493;" COLOR="#6D6B6C" POSITION="right" STYLE="fork"><edge COLOR="#3F95CC" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /></node>
<node ID="0AE2EA7E-FA67-4910-B688-2EB6ED6D34C5" TEXT="&#28040;&#24687;&#31215;&#21387;" COLOR="#6D6B6C" POSITION="right" STYLE="fork"><edge COLOR="#3F95CC" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /></node>
<node ID="DBD6D461-28DE-4E53-9D34-DB46D3DE4C68" TEXT="&#28040;&#24687;&#20002;&#22833;" COLOR="#6D6B6C" POSITION="right" STYLE="fork"><edge COLOR="#3F95CC" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p>消息中间件持久化存储到磁盘中，理论上消息不会丢失（由消息中间件保证），所以确认回复消息后，消息生产者才能确定消息发送成功。因此会产生消息重复的情况，参照消息重复的解决方式。</p></body>
</html>
</richcontent>
</node>
<node ID="9C35A73A-AA55-46B4-9CA1-2996B07165C3" TEXT="&#28040;&#24687;&#37325;&#22797;" COLOR="#6D6B6C" POSITION="right" STYLE="fork"><edge COLOR="#3F95CC" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><node ID="53F3FCB4-0F09-439A-92EF-AC42A7EA723A" TEXT="&#21457;&#36865;&#31471;&#24212;&#29992;&#37325;&#22797;&#21457;&#36865;" COLOR="#6D6B6C" POSITION="right" STYLE="fork"><edge COLOR="#3F95CC" WIDTH="4" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p>消息中间件接收消息并成功存储，此时出现如下情况，导致应用端没有接收到消息发送成功的返回。</p><p></p><p>1、消息中间件宕机</p><p>2、消息中间件响应超时</p><p>3、网络连接故障</p><p>4、发送端应用宕机</p><p></p><p>解决方法：</p><p>一、重试发送消息时，使用同样的消息id，而不在消息中间件端产生消息id。ActiveMQ消息头中的消息id不建议修改，使用消息属性:</p><p>message.setStringProperty(&quot;MessageId&quot;, &quot;Jane&quot;);</p></body>
</html>
</richcontent>
</node>
<node ID="C024774A-34AF-46DD-A826-AB57B44508F9" TEXT="&#28040;&#24687;&#20013;&#38388;&#20214;&#37325;&#22797;&#25237;&#36882;" COLOR="#6D6B6C" POSITION="right" STYLE="fork"><edge COLOR="#3F95CC" WIDTH="4" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p>接收端接收到消息，处理后，在确认消息前出现如下问题：</p><p>1、消费者应用宕机</p><p>2、网络故障</p><p>3、处理消息超时</p><p>4、消息中间件宕机</p><p></p><p>解决方法：</p><p>消费者应用处理消息是幂等操作。</p></body>
</html>
</richcontent>
</node>
</node>
</node>
<node ID="F538D9C4-A8AE-40B0-A598-A74D1575B135" TEXT="&#24322;&#24120;&#28040;&#24687;" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#E57C40" WIDTH="6" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p>过期信息</p><p>定期清理无效的队列</p><p><span>定期自动清理无效的</span><span>Topic</span><span>和</span><span>Queue,</span><span>这个配置，只会清除设置的时间内，没有被订阅，同时队列没有遗留数据的队列。</span></p><p></p><p><span>同时，对于</span><span>boker</span><span>节点，需要设置</span><span>schedulePeriodForDestinationPurge </span><span>参数，表示多长之间执行一次检测。</span></p><p>设置消息的全局过期时间</p><p>过期的时间会进入死信，死信也会沿用此时间，到期后，系统就会自动删除信息了</p><p></p><p>————————</p><p>死信队列</p><p>————————</p><p>信息丢失</p><p>---------------------</p><p>消息积压</p></body>
</html>
</richcontent>
<node ID="2CB0876C-9610-4135-A96E-9A1C56715606" TEXT="&#27515;&#20449;&#38431;&#21015;" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#E57C40" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p>若开启事务，则在事务提交之前处理异常，再提交事务，若不提交事务，消息不会移除</p><p><span>若使用自动确认，重试</span><span>4次</span><span>后仍然异常消息移动到死信队列中</span></p><p>--------------------- </p><p><span>如果你想在消息处理失败后，不被服务器删除，还能被其他消费者处理或重试，可以关闭</span><span>AUTO_ACKNOWLEDGE</span><span>，将</span><span>ack</span><span>交由程序自己处理。那如果使用了</span><span>AUTO_ACKNOWLEDGE</span><span>，消息是什么时候被确认的，还有没有阻止消息确认的方法？有！</span></p><p></p><p><span>消费消息有</span><span>2</span><span>种方法，一种是调用</span><span>consumer.receive()</span><span>方法，该方法将阻塞直到获得并返回一条消息。这种情况下，消息返回给方法调用者之后就自动被确认了。另一种方法是采用</span><span>listener</span><span>回调函数，在有消息到达时，会调用</span><span>listener</span><span>接口的</span><span>onMessage</span><span>方法。在这种情况下，在</span><span>onMessage</span><span>方法执行完毕后，消息才会被确认，此时只要在方法中抛出异常，该消息就不会被确认。那么问题来了，如果一条消息不能被处理，会被退回服务器重新分配，如果只有一个消费者，该消息又会重新被获取，重新抛异常。就算有多个消费者，往往在一个服务器上不能处理的消息，在另外的服务器上依然不能被处理。难道就这么退回</span><span>--</span><span>获取</span><span>--</span><span>报错死循环了吗？</span></p><p></p><p><span>在重试</span><span>6</span><span>次后，</span><span>ActiveMQ</span><span>认为这条消息是</span><span>“</span><span>有毒</span><span>”</span><span>的，将会把消息丢到死信队列里。如果你的消息不见了，去</span><span>ActiveMQ.DLQ</span><span>里找找，说不定就躺在那里。</span></p></body>
</html>
</richcontent>
<node ID="7157EA25-F096-4FA2-BAC1-03F40A1BD653" TEXT="" COLOR="#6D6C6C" POSITION="left" STYLE="fork"><edge COLOR="#E57C40" WIDTH="4" /><font NAME="PingFangSC-Regular" SIZE="20" /><node ID="A778700B-6566-4E04-BA70-0FB28737CA81" TEXT="" COLOR="#6D6C6C" POSITION="left" STYLE="fork"><edge COLOR="#E57C40" WIDTH="3" /><font NAME="PingFangSC-Regular" SIZE="20" /></node>
</node>
</node>
</node>
<node ID="D9E38145-9B3D-4DFB-8AF8-78106E318881" TEXT="&#20248;&#21270;" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#CC6226" WIDTH="6" /><font NAME="PingFangSC-Regular" SIZE="20" /></node>
<node ID="543554C1-1C59-4AA2-B8E5-40329977F810" TEXT="Consumer&#39640;&#32423;&#29305;&#24615;" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#4AAEB3" WIDTH="6" /><font NAME="PingFangSC-Regular" SIZE="20" /><node ID="0609BE31-317C-454F-982A-C7675F040ED6" TEXT="Exclusive Consumer" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#4AAEB3" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>独有消费者</span><span>(ExclusiveConsumer)</span></p><p><span>Queue</span><span>中的消息是按照顺序被分发到</span><span>consumers</span><span>的。然而，当你有多个</span><span>consumers</span><span>同时</span></p><p><span>从相同的</span><span>queue</span><span>中提取消息时，你将失去这个保证。因为这些消息是被多个线程并发的处理。有的时候，保证消息按照顺序处理是很重要的。例如，你可能不希望在插入订单操作结束之前执行更新这个订单的操作。</span></p><p><span>ActiveMQ</span><span>从</span><span>4.x</span><span>版本起开始支持</span><span>ExclusiveConsumer</span><span>。</span><span>Broker</span><span>会从多个</span><span>consumers</span><span>中挑选一个</span><span>consumer</span><span>来处理</span><span>queue</span><span>中所有的消息，从而保证了消息的有序处理。如果这个</span><span>consumer</span><span>失效，那么</span><span>broker</span><span>会自动切换到其它的</span><span>consumer</span><span>。可以通过</span><span>Destination</span></p><p><span>Options</span><span>来创建一个</span><span>ExclusiveConsumer</span><span>，如下</span><span>:</span></p><p>queue=newActiveMQQueue(&quot;TEST.QUEUE?consumer.exclusive=true&quot;);</p><p><span>consumer=session.createConsumer(queue);</span><span>还可以给</span><span>consumer</span><span>设置优先级，以便针对网络情况进行优化，如下</span><span>:</span></p><p>queue=new</p><p>ActiveMQQueue(&quot;TEST.QUEUE?consumer.exclusive=true&amp;consumer.priority=10&quot;);</p></body>
</html>
</richcontent>
</node>
<node ID="6CFEFF98-EAAD-4052-AFEE-E27AE1E1F2A1" TEXT="Consumer Dispatche Async" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#4AAEB3" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>在</span><span>act i vemq4. 0</span><span>以后，你可以选择</span><span>br oker </span><span>同步或异步的把消息分发给消费者。可以设置</span><span> di spat chAsync </span><span>属性，默认是</span><span>t r ue</span><span>，通常情况下这是最佳的</span></p></body>
</html>
</richcontent>
</node>
<node ID="FE45D081-7210-4F56-9E63-125605EB7E6E" TEXT="Consumer Priority" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#4AAEB3" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>JMS JMSPriority </span><span>定义了十个消息优先级值，</span><span>0 </span><span>是最低的优先级，</span><span>9 </span><span>是最高的优先级。另</span><span> </span><span>外，客户端应当将</span><span>0‐4 </span><span>看作普通优先级，</span><span>5‐9 </span><span>看作加急优先级。</span></p></body>
</html>
</richcontent>
</node>
<node ID="B40E78CB-D2A7-4418-85BE-231ED7240074" TEXT="Manage Durable Subscribers" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#4AAEB3" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>消息的持久化，保证了消费者离线后，再次进入系统，不会错过消息，但是这也会消耗很多的资源。从</span><span>5.6</span><span>开始，可以对持久化消息进行如下管理</span><span>:</span></p><p>Removinginactivesubscribers</p><p><span>我们还可能希望删除那些不活动的订阅者，如下</span><span>:</span></p><p>&lt;brokername=&quot;localhost&quot;offlineDurableSubscriberTimeout=&quot;86400000&quot;offlineDurableSubscriberTaskSchedule=&quot;3600000&quot;&gt;</p><p><span>1:offlineDurableSubscriberTimeout:</span><span>离线多长时间就过期删除，缺省是</span><span>-1</span><span>，就是不删除</span><span>2:offlineDurableSubscriberTaskSchedule:</span><span>多长时间检查一次，缺省</span><span>300000</span><span>，单位毫秒</span></p></body>
</html>
</richcontent>
</node>
<node ID="473513B2-991B-4671-8644-167509040403" TEXT="Message Groups" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#4AAEB3" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>MessageGroups</span><span>就是对消息分组，它是</span><span>ExclusiveConsumer</span><span>功能的增强</span><span>:</span><span>逻辑上，</span><span>MessageGroups</span><span>可以看成是一种并发的</span><span>ExclusiveConsumer</span><span>。跟所有的消</span></p><p><span>息都由唯一的</span><span>consumer</span><span>处理不同，</span><span>JMS</span><span>消息属性</span><span>JMSXGroupID</span><span>被用来区分</span><span>messagegroup</span><span>。</span><span>MessageGroups</span><span>特性保证所有具有相同</span><span>JMSXGroupID</span><span>的消息会被分发到相同的</span><span>consumer(</span><span>只要这个</span><span>consumer</span><span>保持</span><span>active)</span><span>。</span></p><p><span>另外一方面，</span><span>MessageGroups</span><span>特性也是一种负载均衡的机制。在一个消息被分发到</span><span>consumer</span><span>之前，</span><span>broker</span><span>首先检查消息</span><span>JMSXGroupID</span><span>属性。如果存在，那么</span><span>broker</span><span>会检查是否有某个</span><span>consumer</span><span>拥有这个</span><span>messagegroup</span><span>。如果没有，那么</span><span>broker</span><span>会选择一个</span><span>consumer</span><span>，并将它关联到这个</span><span>messagegroup</span><span>。此后，这个</span><span>consumer</span><span>会接收这个</span><span>messagegroup</span><span>的所有消息，直到</span><span>:</span></p><p><span>1:Consumer</span><span>被关闭</span></p><p><span>2:Messagegroup</span><span>被关闭，通过发送一个消息，并设置这个消息的</span><span>JMSXGroupSeq</span><span>为</span><span>-1</span></p><p><span>创建一个</span><span>MessageGroups</span><span>，只需要在</span><span>message</span><span>对象上设置属性即可，如下</span><span>:message.setStringProperty(&quot;JMSXGroupID&quot;,&quot;GroupA&quot;)</span></p><p></p><p><span>关闭一个</span><span>MessageGroups</span><span>，只需要在</span><span>message</span><span>对象上设置属性即可，</span></p><p><span>如下</span><span>:message.setStringProperty(&quot;JMSXGroupID&quot;,&quot;GroupA&quot;);</span></p><p>message.setIntProperty(&quot;JMSXGroupSeq&quot;,-1);</p></body>
</html>
</richcontent>
</node>
<node ID="18673FF8-DF28-4B76-8590-8FF7967F6ABC" TEXT="Message Selectors" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#4AAEB3" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>MSSelectors</span><span>用在获取消息的时候，可以基于消息属性和</span><span>Xpath</span><span>语法对消息进行过滤。</span><span>JMSSelectors</span><span>由</span><span>SQL92</span><span>语义定义。以下是个</span><span>Selectors</span><span>的例子</span><span>:</span></p><p><span>consumer=session.createConsumer(destination,&quot;JMSType=&apos;car&apos;ANDweight&gt;2500&quot;);1:JMSSelectors</span><span>表达式中，可以使用</span><span>IN</span><span>、</span><span>NOTIN</span><span>、</span><span>LIKE</span><span>等</span></p><p><span>2:</span><span>需要注意的是，</span><span>JMSSelectors</span><span>表达式中的日期和时间需要使用标准的</span><span>long</span><span>型毫秒值</span><span>3:</span><span>表达式中的属性不会自动进行类型转换，例如</span><span>:</span></p><p><span>myMessage.setStringProperty(&quot;NumberOfOrders&quot;,&quot;2&quot;);</span><span>那么此时</span><span>“NumberOfOrders&gt;1”</span><span>求值结果会是</span><span>false</span></p><p><span>4:MessageGroups</span><span>虽然可以保证具有相同</span><span>messagegroup</span><span>的消息被唯一的</span><span>consumer</span><span>顺序处理，但是却不能确定被哪个</span><span>consumer</span><span>处理。在某些情况下，</span><span>MessageGroups</span><span>可以和</span><span>JMSSelector</span><span>一起工作，</span></p><p><span>例如</span><span>:</span><span>设想有三个</span><span>consumers</span><span>分别是</span><span>A</span><span>、</span><span>B</span><span>和</span><span>C</span><span>。你可以在</span><span>producer</span><span>中为消息设置三个</span><span>messagegroups</span><span>分别是</span><span>“A”</span><span>、</span><span>“B”</span><span>和</span><span>“C”</span><span>。然后令</span><span>consumerA</span><span>使用</span><span>“JMXGroupID=‘A’”</span><span>作为</span><span>selector</span><span>。</span><span>B</span><span>和</span><span>C</span><span>也同理。这样就可以保证</span><span>messagegroupA</span><span>的消息只被</span><span>consumerA</span><span>处理。需要注意的是，这种做法有以下缺点</span><span>:</span></p><p><span>(1)producer</span><span>必须知道当前正在运行的</span><span>consumers</span><span>，也就是说</span><span>producer</span><span>和</span><span>consumer</span><span>被耦合到一起。</span><span>(2)</span><span>如果某个</span><span>consumer</span><span>失效，那么应该被这个</span><span>consumer</span><span>消费的消息将会一直被积压在</span><span>broker</span><span>上。</span></p></body>
</html>
</richcontent>
</node>
<node ID="F7CA7C02-8405-4EA4-A1E9-47C2CA7D75E0" TEXT="Redelivery Policy" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#4AAEB3" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /></node>
<node ID="1788CA02-8C32-471C-911B-B7F71EDD3F48" TEXT="SlowConsumer Handling" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#4AAEB3" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>Prefetch</span><span>机制</span></p><p><span>ActiveMQ</span><span>通过</span><span>Prefetch</span><span>机制来提高性能，方式是在客户端的内存里可能会缓存一定</span></p><p><span>数量的消息。缓存消息的数量由</span><span>prefetchlimit</span><span>来控制。当某个</span><span>consumer</span><span>的</span><span>prefetch</span></p><p><span>buffer</span><span>已经达到上限，那么</span><span>broker</span><span>不会再向</span><span>consumer</span><span>分发消息，直到</span><span>consumer</span><span>向</span><span>broker</span><span>发送消息的确认，确认后的消息将会从缓存中去掉。</span></p><p><span>可以通过在</span><span>ActiveMQConnectionFactory</span><span>或者</span><span>ActiveMQConnection</span><span>上设置</span></p><p><span>ActiveMQPrefetchPolicy</span><span>对象来配置</span><span>prefetchpolicy</span><span>。也可以通过</span><span>connectionoptions</span><span>或者</span><span>destinationoptions</span><span>来配置。例如</span><span>:</span></p><p>tcp://localhost:61616?jms.prefetchPolicy.all=50</p><p>tcp://localhost:61616?jms.prefetchPolicy.queuePrefetch=1</p><p>queue=newActiveMQQueue(&quot;TEST.QUEUE?consumer.prefetchSize=10&quot;);</p><p><span>prefetchsize</span><span>的缺省值如下</span><span>:</span></p><p>1:persistentqueues(defaultvalue:1000)</p><p>2:non-persistentqueues(defaultvalue:1000)</p><p>3:persistenttopics(defaultvalue:100)</p><p>4:non-persistenttopics(defaultvalue:Short.MAX_VALUE-1)</p></body>
</html>
</richcontent>
</node>
</node>
<node ID="4EDB5E49-9A5F-4B03-922C-69DF7534856B" TEXT="Message&#39640;&#32423;&#29305;&#24615;" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#CC6226" WIDTH="6" /><font NAME="PingFangSC-Regular" SIZE="20" /><node ID="83486390-230A-4E77-93EB-11E14E803AA5" TEXT="Message Properties" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#CC6226" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p>常见的一些属性说明</p><p><span>1:Queue</span><span>的消息默认是持久化的</span></p><p><span>2:</span><span>消息的优先级默认是</span><span>4</span></p><p><span>3:</span><span>消息发送时设置了时间戳</span></p><p><span>4:</span><span>消息的过期时间默认是永不过期，过期的消息进入</span><span>DLQ</span><span>，可以配置</span><span>DLQ</span><span>及其处理策略</span></p><p><span>5:</span><span>如果消息时重发的，将会标记出来</span></p><p><span>6:JMSReplyTo</span><span>标识响应消息发送到哪个</span><span>Queue</span></p><p><span>7:JMSCorelationID</span><span>标识此消息相关联的消息</span><span>id</span><span>，可以用这个标识把多个消息连接起来</span></p><p><span>8:JMS</span><span>同时也记录了消息重发的次数，默认是</span><span>6</span><span>次</span></p><p><span>9:</span><span>如果有一组关联的消息需要处理，可以分组</span><span>:</span><span>只需要设置消息组的名字和这个消息是第几</span></p><p>个消息</p><p><span>10:</span><span>如果消息中一个事务环境，则</span><span>TXID</span><span>将被设置</span></p><p><span>11:</span><span>此外</span><span>ActiveMQ</span><span>在服务器端额外设置了消息入列和出列的时间戳</span></p><p><span>12:ActiveMQ</span><span>里消息属性的值，不仅可以用基本类型，还可以用</span><span>List</span><span>或</span><span>Map</span><span>类型</span></p></body>
</html>
</richcontent>
</node>
<node ID="A6368227-C7F7-4600-A83D-6577D14056A6" TEXT="Advisory Message" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#CC6226" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>支持获取如下信息</span><span>:</span></p><p><span>1:consumers,producers</span><span>和</span><span>connections</span><span>的启动和停止</span></p><p><span>2:</span><span>创建和销毁</span><span>temporarydestinations</span></p><p><span>3:topics</span><span>和</span><span>queues</span><span>的消息过期</span></p><p><span>4:brokers</span><span>发送消息给</span><span>destinations</span><span>，但是没有</span><span>consumers5:connections</span><span>启动和停止</span></p><p><span>几点说明</span><span>:</span></p><p><span>1:</span><span>所有</span><span>Advisory</span><span>的</span><span>topic</span><span>，前缀是</span><span>:ActiveMQ.Advisory</span></p><p><span>2:</span><span>所有</span><span>Advisory</span><span>的消息类型是</span><span>:‘Advisory’</span><span>，所有的</span><span>Advisory</span><span>都有的消息属性有</span><span>:originBrokerId</span><span>、</span></p><p><span>originBrokerName</span><span>、</span><span>originBrokerURL</span></p><p><span>3:</span><span>具体支持的</span><span>topic</span><span>和</span><span>queue</span><span>，请参看</span><span>http://activemq.apache.org/advisory-message.html</span></p><p><span>打开</span><span>Advisories</span><span>，默认</span><span>Advisory</span><span>的功能是关闭的</span></p></body>
</html>
</richcontent>
</node>
<node ID="2BA16981-191D-45BC-8F14-448AFE3E5C98" TEXT="&#24310;&#36831;&#21644;&#23450;&#26102;&#28040;&#24687;&#25237;&#36882;" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#CC6226" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>延迟和定时消息投递</span><span>(DelayandScheduleMessageDelivery)</span></p><p><span>有时候我们不希望消息马上被</span><span>broker</span><span>投递出去，而是想要消息</span><span>60</span><span>秒以后发给消费者，或者我们想</span></p><p><span>让消息没隔一定时间投递一次，一共投递指定的次数。。。类似这种需求，</span><span>ActiveMQ</span><span>提供了一种</span><span>broker</span><span>端消息定时调度机制。</span></p><p><span>我们只需要把几个描述消息定时调度方式的参数作为属性添加到消息，</span><span>broker</span><span>端的调度器就会按照我们想要的行为去处理消息。当然需要在</span><span>xml</span><span>中配置</span><span>schedulerSupport</span><span>属性为</span><span>true</span></p><p></p><p><span>一共有</span><span>4</span><span>个属性</span></p><p><span>1:AMQ_SCHEDULED_DELAY:</span><span>延迟投递的时间</span></p><p><span>2:AMQ_SCHEDULED_PERIOD:</span><span>重复投递的时间间隔</span></p><p><span>3:AMQ_SCHEDULED_REPEAT:</span><span>重复投递次数</span></p><p><span>4:AMQ_SCHEDULED_CRON:Cron</span><span>表达式</span></p></body>
</html>
</richcontent>
</node>
<node ID="03D93B27-5679-4246-B78E-8AAA516438CE" TEXT="Blob Messages" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#CC6226" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /></node>
<node ID="94ABF59D-B784-4E24-ACEC-90185972F6D2" TEXT="Message Transformation" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#CC6226" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>有时候需要在</span><span>JMSprovider</span><span>内部进行</span><span>message</span><span>的转换。从</span><span>4.2</span><span>版本起，</span><span>ActiveMQ</span><span>提供了一个</span><span>MessageTransformer</span><span>接口用于进行消息转换，可以在如下对象上调用</span><span>:</span></p><p><span>ActiveMQConnectionFactory</span><span>、</span><span>ActiveMQConnection</span><span>、</span><span>ActiveMQSession</span><span>、</span><span>ActiveMQMessageConsumer</span><span>、</span><span>ActiveMQMessageProducer</span></p><p><span>在消息被发送到</span><span>JMSprovider</span><span>的消息总线前进行转换。通过</span><span>producerTransform</span><span>方法</span></p><p><span>在消息到达消息总线后，但是在</span><span>consumer</span><span>接收到消息前进行转换。通过</span><span>consumerTransform</span><span>方法</span></p><p><span>当然</span><span>MessageTransformer</span><span>接口的实现，需要你自己来提供</span></p></body>
</html>
</richcontent>
</node>
</node>
<node ID="29048ED4-8A5F-4DEE-A215-00FB702F34C2" TEXT="Message Dispatch&#39640;&#32423;&#29305;&#24615;" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#E5B322" WIDTH="6" /><font NAME="PingFangSC-Regular" SIZE="20" /><node ID="0B310968-3B02-4992-BA8F-99F76EBAF9C1" TEXT="Message Cursors" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#E5B322" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>从</span><span>Act i veMQ5. 0. 0</span><span>版本开始，消息发送系统采用一种混合型的发送模式，当消息消费者处</span><span> </span><span>理活跃状态时，允许消息发送系统直接把持久消息发送给消费者，当消费者处于不活跃状态下，切换使</span><span> </span><span>用</span><span>Cur sor s</span><span>来处理消息的发送。</span></p><p></p><p>Message Cursors分成三种类型 </p><p>1:Store-based</p><p>2:VM</p><p>3:File-based</p></body>
</html>
</richcontent>
</node>
<node ID="C4B12807-C80B-430E-A7B3-714E2BCF2E3F" TEXT="Async Sends" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#E5B322" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><node ID="7ED73DDA-899D-40D6-9051-BA8BEEF1B42E" TEXT="What" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#E5B322" WIDTH="4" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>AciveMQ</span><span>支持异步和同步发送消息，是可以配置的。通常对于快的消费者，</span></p><p><span>是直接把消息同步发送过去，但对于一个</span><span>Sl ow Consumer</span><span>，你使用同步发送消息</span><span> </span><span>可能出现</span><span>Pr oducer </span><span>堵塞等现象，慢消费者适合使用异步发送</span></p></body>
</html>
</richcontent>
</node>
<node ID="8F423353-7AC3-44E3-9DD3-514DDB30A34C" TEXT="How" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#E5B322" WIDTH="4" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p>配置使用</p><p><span>1:ActiveMQ</span><span>默认设置</span><span>dispatcheAsync=true</span><span>是最好的性能设置。</span></p><p><span>如果你处理的是</span><span>FastConsumer</span><span>则使用</span><span>dispatcheAsync=false</span></p><p><span>2:</span><span>在</span><span>ConnectionURI</span><span>级别来配置使用</span><span>AsyncSend</span></p><p>cf=newActiveMQConnectionFactory(&quot;tcp://locahost:61616?jms.useAsyncSend=true&quot;);</p><p><span>3:</span><span>在</span><span>ConnectionFactory</span><span>级别来配置使用</span><span>AsyncSend</span></p><p>((ActiveMQConnectionFactory)connectionFactory).setUseAsyncSend(true);</p><p><span>4:</span><span>在</span><span>Connection</span><span>级别来配置使用</span><span>AsyncSend</span></p><p>((ActiveMQConnection)connection).setUseAsyncSend(true);</p></body>
</html>
</richcontent>
</node>
</node>
<node ID="80EB4EB7-2C9E-4BFB-8BAA-522E505AEA72" TEXT="Dispatch Policies" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#E5B322" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><node ID="296E62BF-A6F8-48C1-91DC-7F8F09FE4A79" TEXT="&#20005;&#26684;&#39034;&#24207;&#20998;&#21457;&#31574;&#30053;(Strict Order Dispatch Policy)" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#E5B322" WIDTH="4" /><font NAME="PingFangSC-Regular" SIZE="20" /></node>
<node ID="9F7AFA2B-DAE8-4312-89DE-31360BC0ED18" TEXT="&#36718;&#35810;&#20998;&#21457;&#31574;&#30053;(Round Robin Dispatch Policy)" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#E5B322" WIDTH="4" /><font NAME="PingFangSC-Regular" SIZE="20" /></node>
</node>
<node ID="6AF497AD-21C1-43A4-BEB0-5722B999FFF9" TEXT="Optimized Acknowledgement" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#E5B322" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p>批量确认消息</p></body>
</html>
</richcontent>
</node>
<node ID="93000129-5D16-47EF-B1BF-16736382AE46" TEXT="Producer FlowControl" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#E5B322" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>生产者流量控制</span><span>(ProducerFlowControl)</span><span>流量控制的含义</span><span>:</span><span>当生产者产生消息过快，超过流量限制的时候，生产者将会被阻</span></p><p><span>塞直到资源可以继续使用，或者抛出一个</span><span>JMSException</span><span>，可以通过</span><span>&lt;systemUsage&gt;</span><span>来配置。同步发送消息的</span><span>producer</span><span>会自动使用</span><span>producerflowcontrol;</span><span>对于异步发送消息的</span><span>producer</span><span>，要使用</span><span>producerflowcontrol</span><span>，你先要为</span><span>connection</span><span>配置一个</span></p><p><span>ProducerWindowSize</span><span>参数，如下</span><span>:</span></p><p>((ActiveMQConnectionFactory)cf).setProducerWindowSize(1024000);</p><p><span>ProducerWindowSize</span><span>是</span><span>producer</span><span>在发送消息的过程中，收到</span><span>broker</span><span>对于之前发送消</span></p><p>息的确认之前，能够发送消息的最大字节数</p></body>
</html>
</richcontent>
</node>
</node>
<node ID="76CC672D-7A39-49CC-BD5F-AB74EFD42DE3" TEXT="Destination&#39640;&#32423;&#29305;&#24615;" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#9536AE" WIDTH="6" /><font NAME="PingFangSC-Regular" SIZE="20" /><node ID="0D066076-8E80-4D19-A10F-B920BF664025" TEXT="Wildcards" COLOR="#6D6B6C" POSITION="left" STYLE="fork"><edge COLOR="#9536AE" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>ActiveMQ</span><span>支持以下三种</span><span>wildcards:</span></p><p><span>1:“. ” </span><span>用于作为路径上名字间的分隔符</span></p><p><span>2:“*” </span><span>用于匹配路径上的任何名字</span></p><p><span>3:&quot;&gt;&quot; </span><span>用于递归地匹配任何以这个名字开始的</span><span>destination</span></p><p></p><p>示例：</p><p><span>1:PRICE.&gt;:</span><span>匹配任何产品的价格变动</span></p><p><span>2:PRICE.STOCK.&gt;:</span><span>匹配任何产品的股票价格变动</span></p><p><span>3:PRICE.STOCK.NASDAQ.*:</span><span>匹配任何在</span><span>NASDAQ</span><span>下面的产品的股票价格变动</span></p><p><span>4:PRICE.STOCK.*.IBM:</span><span>匹配任何</span><span>IBM</span><span>的产品的股票价格变动</span></p><p><span>客户化路径分隔符，比如你想要用</span><span>“/”</span><span>来替换</span><span>“.”&lt;plugins&gt;</span></p><p>&lt;destinationPathSeparatorPlugin/&gt;&lt;/plugins&gt;</p></body>
</html>
</richcontent>
</node>
<node ID="23FB2F70-D11D-4162-9886-17F8FA39526C" TEXT="Composite Destinations" COLOR="#6D6C6C" POSITION="left" STYLE="fork"><edge COLOR="#9536AE" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>组合队列允许用一个虚拟的</span><span>destination</span><span>代表多个</span><span>destinations</span><span>。这样就可以通过</span><span>composite</span></p><p><span>destinations</span><span>在一个操作中同时向多个</span><span>queue</span><span>发送消息。</span></p><p><span>1:</span><span>客户端实现的方式</span></p><p><span>在</span><span>composite destinations</span><span>中，多个</span><span>destination</span><span>之间采用</span><span>“,”</span><span>分割。例如</span><span>:</span></p><p>Queue queue=new ActiveMQQueue(&quot;FOO.A,FOO.B,FOO.C&quot;);</p><p><span>如果你希望使用不同类型的</span><span>destination</span><span>，那么需要加上前缀如</span><span>queue://</span><span>或</span><span>topic://</span><span>，</span></p><p><span>例如</span><span>:Queue queue=new ActiveMQQueue(&quot;FOO.A,topic://NOTIFY.FOO.A&quot;);</span></p><p></p><p><span>2:</span><span>在</span><span>xml</span><span>配置实现的方式</span></p><p>&lt;destinationInterceptors&gt;</p><p>	&lt;virtualDestinationInterceptor&gt;</p><p>		&lt;virtualDestinations&gt;</p><p>			&lt;compositeQueuename=&quot;MY.QUEUE&quot;&gt;</p><p>				&lt;forwardTo&gt;</p><p>					&lt;queuephysicalName=&quot;my-queue&quot;/&gt;</p><p>					&lt;queuephysicalName=&quot;my-queue2&quot;/&gt;&lt;/forwardTo&gt;</p><p>			&lt;/compositeQueue&gt;</p><p>		&lt;/virtualDestinations&gt;</p><p>	&lt;/virtualDestinationInterceptor&gt;</p><p>&lt;/destinationInterceptors&gt;</p><p></p><p><span>3:</span><span>使用</span><span>filtered destinations</span><span>，在</span><span>xml</span><span>配置实现的方式</span></p><p>&lt;destinationInterceptors&gt;</p><p>	&lt;virtualDestinationInterceptor&gt;</p><p>		&lt;virtualDestinations&gt;</p><p>			&lt;compositeQueuename=&quot;MY.QUEUE&quot;&gt;</p><p>				&lt;forwardTo&gt;</p><p>					&lt;filteredDestinationselector=&quot;odd=&apos;yes&apos;&quot;queue=&quot;FOO&quot;/&gt;</p><p>					&lt;filteredDestinationselector=&quot;i=5&quot;topic=&quot;BAR&quot;/&gt;</p><p>				&lt;/forwardTo&gt;</p><p>			&lt;/compositeQueue&gt;</p><p>		&lt;/virtualDestinations&gt;</p><p>	&lt;/virtualDestinationInterceptor&gt;</p><p>&lt;/destinationInterceptors&gt;</p><p></p><p><span>4:</span><span>避免在</span><span>network</span><span>连接</span><span>broker</span><span>中，出现重复消息</span></p><p>&lt;networkConnectors&gt;</p><p>	&lt;networkConnector uri=&quot;static://(tcp://localhost:61617)&quot;&gt;</p><p>		&lt;excludedDestinations&gt;</p><p>			&lt;queuephysicalName=&quot;Consumer.*.VirtualTopic.&gt;&quot;/&gt;</p><p>		&lt;/excludedDestinations&gt;</p><p>	&lt;/networkConnector&gt;</p><p>&lt;/networkConnectors&gt;</p></body>
</html>
</richcontent>
</node>
<node ID="DD88BDF8-CD96-4E9D-B1F1-8649A6EDC797" TEXT="Configure Startup Destinations" COLOR="#6D6C6C" POSITION="left" STYLE="fork"><edge COLOR="#9536AE" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p>Configure Startup Destinations</p><p></p><p><span>如果需要在</span><span>ActiveMQ</span><span>启动的时候，创建</span><span>Destination</span><span>的话，可以如下配置</span><span>:</span></p><p></p><p>&lt;broker xmlns=&quot;http://activemq.apache.org/schema/core&quot;&gt;</p><p>&lt;destinations&gt;</p><p>	&lt;queue physicalName=&quot;FOO.BAR&quot;/&gt;</p><p>	&lt;topic physicalName=&quot;SOME.TOPIC&quot;/&gt;</p><p>&lt;/destinations&gt;</p><p>&lt;/broker&gt;</p></body>
</html>
</richcontent>
</node>
<node ID="4195D19A-83D7-4710-9DBD-7A99FE1E9AFE" TEXT="Delete Inactive Destinations" COLOR="#6D6C6C" POSITION="left" STYLE="fork"><edge COLOR="#9536AE" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>一般情况下，</span><span>ActiveMQ</span><span>的</span><span>queue</span><span>在不使用之后，可以通过</span><span>web</span><span>控制台或是</span><span>JMX</span><span>方式来删除掉。当</span></p><p><span>然，也可以通过配置，使得</span><span>broker</span><span>可以自动探测到无用的队列</span><span>(</span><span>一定时间内为空的队列</span><span>)</span><span>并删除掉，回</span></p><p>收响应资源。</p><p><span>可以如下配置</span><span>:</span></p><p>&lt;broker xmlns=&quot;http://activemq.apache.org/schema/core&quot; schedulePeriodForDestinationPurge=&quot;10000&quot;&gt;</p><p>&lt;destinationPolicy&gt;</p><p>	&lt;policyMap&gt;</p><p>		&lt;policyEntries&gt;</p><p>			&lt;policyEntry queue=&quot;&gt;&quot;gcInactiveDestinations=&quot;true&quot; inactiveTimoutBeforeGC=&quot;30000&quot;/&gt;</p><p>		&lt;/policyEntries&gt;</p><p>	&lt;/policyMap&gt;</p><p>&lt;/destinationPolicy&gt;</p><p>&lt;/broker&gt;</p><p></p><p><span>说明</span><span>:</span></p><p><span>schedulePeriodForDestinationPurge:</span><span>设置多长时间检查一次，这里是</span><span>10</span><span>秒，默认为</span><span>0</span></p><p><span>inactiveTimoutBeforeGC:</span><span>设置当</span><span>Destination</span><span>为空后，多长时间被删除，这里是</span><span>30</span><span>秒，默认为</span><span>60</span></p><p><span>gcInactiveDestinations:</span><span>设置删除掉不活动队列，默认为</span><span>false</span></p></body>
</html>
</richcontent>
</node>
<node ID="19DD40A3-7FAA-4D60-B29D-8670AE875BED" TEXT="Destination Options" COLOR="#6D6C6C" POSITION="left" STYLE="fork"><edge COLOR="#9536AE" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>使用示例</span><span>:</span></p><p>queue = new ActiveMQQueue(&quot;TEST.QUEUE?consumer.dispatchAsync=false&amp;consumer.prefetchSize=10&quot;);</p><p>consumer=session.createConsumer(queue);</p></body>
</html>
</richcontent>
</node>
<node ID="BEE8FAE3-CD62-4106-942B-3590F0888917" TEXT="Visual Destinations" COLOR="#6D6C6C" POSITION="left" STYLE="fork"><edge COLOR="#932092" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p>概述</p><p><span>虚拟</span><span>Destinations</span><span>用来创建逻辑</span><span>Destinations</span><span>，客户端可以通过它来生产和消费消</span></p><p><span>息，它会把消息映射到物理</span><span>Destinations</span><span>。</span></p><p><span>ActiveMQ</span><span>支持两种方式</span><span>:</span></p><p><span>1:</span><span>虚拟主题</span><span>(VirtualTopics)</span></p><p><span>2:</span><span>组合</span><span>Destinations(CompositeDestinations)</span></p></body>
</html>
</richcontent>
<node ID="40F6F324-2FFA-4D77-86AB-A132DD65B427" TEXT="&#20026;&#20309;&#20351;&#29992;" COLOR="#6D6C6C" POSITION="left" STYLE="fork"><edge COLOR="#932092" WIDTH="4" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p>为何使用虚拟主题</p><p><span>ActiveMQ</span><span>中，</span><span>topic</span><span>只有在持久订阅下才是持久化的。持久订阅时，每个持久订阅</span></p><p><span>者，都相当于一个</span><span>queue</span><span>的客户端，它会收取所有消息。</span></p><p><span>这种情况下存在两个问题</span><span>:</span></p><p><span>1:</span><span>同一应用内</span><span>consumer</span><span>端负载均衡的问题</span><span>:</span><span>也即是同一个应用上的一个持久订阅不能使用多</span></p><p><span>个</span><span>consumer</span><span>来共同承担消息处理功能。因为每个</span><span>consumer</span><span>都会获取所有消息。</span><span>queue</span><span>模式可以解决这个问题，但</span><span>broker</span><span>端又不能将消息发送到多个应用端。所以，</span></p><p><span>既要发布订阅，又要让消费者分组，这个功能</span><span>JMS</span><span>规范本身是没有的。</span></p><p><span>2:</span><span>同一应用内</span><span>consumer</span><span>端</span><span>failover</span><span>的问题</span><span>:</span><span>由于只能使用单个的持久订阅者，如果这个订阅</span></p><p><span>者出错，则应用就无法处理消息了，系统的健壮性不高为了解决这两个问题，</span><span>ActiveMQ</span><span>中实现了虚拟</span><span>Topic</span><span>的功能</span></p></body>
</html>
</richcontent>
</node>
<node ID="0D7DA698-62B2-4DC0-B187-5EAD9CD83163" TEXT="&#22914;&#20309;&#20351;&#29992;" COLOR="#6D6C6C" POSITION="left" STYLE="fork"><edge COLOR="#932092" WIDTH="4" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p>如何使用虚拟主题</p><p></p><p><span>1:</span><span>对于消息发布者来说，就是一个正常的</span><span>Topic</span><span>，名称以</span><span> VirtualTopic. </span><span>开头。例如</span></p><p><span>VirtualTopic.Orders</span><span>，代码示例如下</span><span>:</span></p><p>Topicdestination=session.createTopic(&quot;VirtualTopic.Orders&quot;);</p><p><span>2:</span><span>对于消息接收端来说，是个队列，不同应用里使用不同的前缀作为队列的名称，即可表明自己的身份即可实现消费端应用分组。</span></p><p></p><p><span>例如</span><span>Consumer.A.VirtualTopic.Orders</span><span>，说明它是名称为</span><span>A</span><span>的消费端，同理</span><span>Consumer.B.VirtualTopic.Orders</span><span>说明是一个名称为</span><span>B</span><span>的客户端。可以在同一个应用里使用多个</span><span>consumer</span><span>消费此</span><span>queue</span><span>，则可以实现上面两个功能。</span></p><p><span>又因为不同应用使用的</span><span>queue</span><span>名称不同</span><span>(</span><span>前缀不同</span><span>)</span><span>，所以不同的应用中都可以接收到全部的消息。每个客户端相当于一个持久订阅者，而且这个客户端可以使用多个消费者共同来承担消费任务。</span></p><p></p><p><span>代码示例如下</span><span>:</span></p><p>Destinationdestination=session.createQueue(&quot;Consumer.A.VirtualTopic.Orders&quot;);</p><p></p><p></p><p>3:</p><p><span>默认虚拟主题的前缀是</span><span> :VirtualTopic.&gt; </span></p><p><span>自定义消费虚拟地址默认格式</span><span>:Consumer.*.VirtualTopic.&gt; </span><span>自定义消费虚拟地址可以改，比如下面的配置就把它修改了。</span></p><p></p><p><span>自定义</span><span>VirtualTopic</span><span>。（如下配置，将所有的</span><span>topic</span><span>映射为</span><span>VirtualTopic</span><span>）</span></p><p></p><p>&lt;broker xmlns=&quot;http://activemq.apache.org/schema/core&quot;&gt;  </p><p>  &lt;destinationInterceptors&gt;  </p><p>    &lt;virtualDestinationInterceptor&gt;  </p><p>      &lt;virtualDestinations&gt;  </p><p>        &lt;virtualTopic name=&quot;&gt;&quot; prefix=&quot;Consumer.*.&quot; selectorAware=&quot;false&quot;/&gt;  </p><p>      &lt;/virtualDestinations&gt;  </p><p>    &lt;/virtualDestinationInterceptor&gt;  </p><p>  &lt;/destinationInterceptors&gt;  </p><p>&lt;/broker&gt;  </p></body>
</html>
</richcontent>
</node>
</node>
<node ID="9C67568A-2ECC-45BD-80CC-E2F34B2E58F7" TEXT="Mirrored Queues" COLOR="#6D6C6C" POSITION="left" STYLE="fork"><edge COLOR="#932092" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /><node ID="C38C0D35-8510-4360-8885-27B9E26D8704" TEXT="What" COLOR="#6D6C6C" POSITION="left" STYLE="fork"><edge COLOR="#932092" WIDTH="4" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p>概述</p><p><span>ActiveMQ</span><span>中每个</span><span>queue</span><span>中的消息只能被一个</span><span>consumer</span><span>消费。然而，有时候你可能希望</span></p><p><span>能够监视生产者和消费者之间的消息流。你可以通过使用</span><span>VirtualDestinations</span><span>来建立一个</span><span>virtualqueue</span><span>来把消息转发到多个</span><span>queues</span><span>中。但是为系统中每个</span><span>queue</span><span>都进行如此的配置可能会很麻烦。</span></p></body>
</html>
</richcontent>
</node>
<node ID="2FD90724-FFDB-46A1-BCE7-C4CFF16C5B11" TEXT="How" COLOR="#6D6C6C" POSITION="left" STYLE="fork"><edge COLOR="#932092" WIDTH="4" /><font NAME="PingFangSC-Regular" SIZE="20" /><richcontent TYPE="NOTE"><html><head></head>
<body><p><span>    ActiveMQ</span><span>支持</span><span>MirroredQueues</span><span>。</span><span>Broker</span><span>会把发送到某个</span><span>queue</span><span>的所有消息转发到一个名称类似的</span><span>topic</span><span>，因此监控程序只需要订阅这个</span><span>mirroredqueuetopic</span><span>。为了启用</span><span>MirroredQueues</span><span>，首先要将</span><span>BrokerService</span><span>的</span><span>useMirroredQueues</span><span>属性设置成</span><span>true</span><span>，然后可以通过</span><span>destinationInterceptors</span><span>设置其它属性，如</span><span>mirrortopic</span><span>的前缀，缺省是</span><span> “VirtualTopic.Mirror.”</span><span>。</span></p><p></p><p><span>比如修改后缀的配置示例如下</span><span>:</span></p><p>&lt;destinationInterceptors&gt;</p><p>	&lt;mirroredQueuecopyMessage=&quot;true&quot; postfix=&quot;.qmirror&quot; prefix=&quot;&quot;/&gt;</p><p>&lt;/destinationInterceptors&gt;</p></body>
</html>
</richcontent>
</node>
</node>
<node ID="2E0EC435-6DC5-4E21-A119-09F4DE8B32B1" TEXT="Per Destination Policies" COLOR="#6D6C6C" POSITION="left" STYLE="fork"><edge COLOR="#9536AE" WIDTH="5" /><font NAME="PingFangSC-Regular" SIZE="20" /></node>
</node>
</node>
</map>
