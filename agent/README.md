# MA & EPO Custom Property Fields 

[McAfee - Configuring Custom Properties policy](https://docs.mcafee.com/bundle/agent-5.0.6-product-guide-epolicy-orchestrator/page/GUID-DE594B53-0CEF-4FDD-8339-745A913FD724.html)

The whole point of the custom props functions is to allow you to get information into ePO that would not normally be reported back by the agent: as you say, using it to duplicate a property that ePO already knows about is redundant.

Using McAfee Factor, we can pull in new data from the endpoint and populate it into a property so we can Automated tasks, Run query for particular machines, etc. 

You can modfiy registry keys and create your custom properties. "CustomProps1" and set to your value.

## View the Values

```shell
cmdagent.exe -x
```

## Setting the Values

Custom properties values can be set either at the Agent side (during install or using msaconfig), or at ePO. However, any custom properties set at the Agent side will overwrite values set you might set at ePO during regular Agent-server-communication intervals

```
HKLM\SOFTWARE\Network Associates\ePolicy Orchestrator\Agent\CustomProps\
``` 

```shell
maconfig -CustomProps1 "Property 1″
maconfig.exe -custom -prop1 "'quoted text' 1"
maconfig.exe -custom -prop1 "prop1" -prop2 "prop2".........-prop8 "prop8"
```

```
FrmInst.exe /CustomProps1="Property 1″
```

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
