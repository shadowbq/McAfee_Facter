# MA & EPO Custom Property Fields 

[McAfee - Configuring Custom Properties policy](https://docs.mcafee.com/bundle/agent-5.0.6-product-guide-epolicy-orchestrator/page/GUID-DE594B53-0CEF-4FDD-8339-745A913FD724.html)

The whole point of the custom props functions is to allow you to get information into ePO that would not normally be reported back by the agent: as you say, using it to duplicate a property that ePO already knows about is redundant.

From EPO 5.9.0 and later MA	5.0.5 and later you will recieve the full support of Eight default Custom Properties. [McAfee - How the Custom Properties policy works ](https://docs.mcafee.com/bundle/agent-5.5.1-product-guide-epolicy-orchestrator/page/GUID-DE594B53-0CEF-4FDD-8339-745A913FD724.html)

Using McAfee Factor, we can pull in new data from the endpoint and populate it into a property so we can Automated tasks, Run query for particular machines, etc. 

You can modfiy registry keys and create your custom properties. "CustomProps1" and set to your value.

## Notes:

All commands expect McAfee Agent 5.5.x. Although the commands may work in other versions of MA, the syntax and number of optional custom properties may differ.

## View the Values

`cmdagent -x or -i` will display the properties.

```shell
C:\Program Files\McAfee\Agent>cmdagent.exe -x
Component: McAfee Agent
UserProperty1: FooMonkey

C:\Program Files\McAfee\Agent>cmdagent.exe -i
Component: McAfee Agent
AgentMode: 0
Version: 5.5.1.301
GUID: N/A
TenantId: N/A
LogLocation: C:\ProgramData\McAfee\Agent\logs
InstallLocation: C:\Program Files\McAfee\Agent\
CryptoMode: 0
DataLocation: C:\ProgramData\McAfee\Agent\
EpoServerList:
EpoPortList:
Failed to get value of EpoServerLastUsed
LastASCTime: N/A
LastPolicyUpdateTime: 0
EpoVersion: N/A
Component: McAfee Agent
UserProperty1: FooMonkey
```



## Setting the Values

Custom properties values can be set either at the Agent side (during install or using msaconfig), or at ePO. However, any custom properties set at the Agent side will overwrite values set you might set at ePO during regular Agent-server-communication intervals


```
HKLM\SOFTWARE\Network Associates\ePolicy Orchestrator\Agent\CustomProps\
``` 

```shell
maconfig.exe -custom -prop1 "'quoted text' 1"
maconfig.exe -custom -prop1 "prop1" -prop2 "prop2".........-prop8 "prop8"
[..]
C:\Program Files\McAfee\Agent>maconfig -custom -prop1 "FooMonkey"
2018-12-07 09:23:39.681 maconfig(4132.8012) maconfig.Info: Applying Custom Props.
2018-12-07 09:23:39.858 maconfig(4132.8012) maconfig.Info: sending custom props successful
2018-12-07 09:23:39.860 maconfig(4132.8012) maconfig.Info: Applying Custom Props passed
2018-12-07 09:23:39.864 maconfig(4132.8012) maconfig.Info: configuration finished
```

```
FrmInst.exe /CustomProps1="Property 1″
```

### Using the registry directly

Windows Registry Editor Version 5.00

McAfee protects the registry on `HKEY_LOCAL_MACHINE\SOFTWARE\Network Associates\ePolicy Orchestrator\Agent` so that you can not manually create this key if it does not exist. This is part of the self protections. 

The REG location is also not created on a standalone installation. 

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Network Associates\ePolicy Orchestrator\Agent\CustomProps]
"CustomProps1"="Pilot Group 1"
```

Is this set only when connected to an epo or when pushed from epo? (or is this legacy information?)


## Locking the Values

* Allow view — Enable or disable system administrators to view particular custom property.
* Allow edit — Enable or disable system administrators to edit particular custom property.

If the `Allow edit` option is enabled in the policy local system administrators can change a custom property multiple times on an endpoint they have access to.

[McAfee - Permissions Custom Properties policy](https://docs.mcafee.com/bundle/agent-5.0.6-product-guide-epolicy-orchestrator/page/GUID-4F73953C-503E-46D1-90E4-270BD483D49D.html)

1. Select Menu → Policy → Policy Catalog.
2. From the Product list, select McAfee Agent, then select Custom Properties from the Category list.
3. Click New Policy, type the policy name, then click OK. To edit an existing policy, click the policy Name.
4. Click the new policy name you created from the Policy Catalog page.
5. Set the Allow view and Allow edit options for each Custom Property as needed.
6. Click Save.

## Videos

check out these videos from McAfee Technical on Youtube

* Part 1 <http://www.youtube.com/watch?v=UN_q8i3PkAg>

* Part 2 <http://www.youtube.com/watch?v=VF1zUVZ4fIM>
