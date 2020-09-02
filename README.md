你好！
很冒昧用这样的方式来和你沟通，如有打扰请忽略我的提交哈。我是光年实验室（gnlab.com）的HR，在招Golang开发工程师，我们是一个技术型团队，技术氛围非常好。全职和兼职都可以，不过最好是全职，工作地点杭州。
我们公司是做流量增长的，Golang负责开发SAAS平台的应用，我们做的很多应用是全新的，工作非常有挑战也很有意思，是国内很多大厂的顾问。
如果有兴趣的话加我微信：13515810775  ，也可以访问 https://gnlab.com/，联系客服转发给HR。
# gvisor-tap-vsock 

## Build

```
make
```

## Run

### Host

#### Windows prerequisites

```
$service = New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\GuestCommunicationServices" -Name "00001010-FACB-11E6-BD58-64006A7986D3"
$service.SetValue("ElementName", "gvisor-tap-vsock")
```

More docs: https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/user-guide/make-integration-service

#### Linux prerequisites

On Fedora 32, it worked out of the box. On others distros, you might have to look at https://github.com/mdlayher/vsock#requirements.

For CRC, the driver should be compiled with this patch: https://github.com/code-ready/machine-driver-libvirt/pull/45.

#### Run

```
(host) $ sudo bin/host -debug -logtostderr [-windows if using windows]
```

### VM

```
(host) $ scp bin/vm crc:
(host) $ scp setup.sh crc:
(vm) $ sudo ./vm -debug -logtostderr [-windows if using windows]
(vm) $ sudo ./setup.sh
+ sudo ip addr add 192.168.127.0/24 dev O_O
+ sudo ip link set dev O_O up
+ sudo route del default gw 192.168.130.1
+ sudo route add default gw 192.168.127.1 dev O_O
(vm) $ ping -c1 192.168.127.1
(vm) $ curl http://redhat.com
```
