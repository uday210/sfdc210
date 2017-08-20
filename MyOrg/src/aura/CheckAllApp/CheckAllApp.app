<aura:application >
    <aura:handler name="init" value="this" action="{!c.doinit}"/>
    <aura:attribute name="select_all" type="boolean" default="false"/>
     <aura:attribute name="select_all_obj" type="Object" />
   
    Select All :<ui:inputCheckbox click="{!c.checkall}"/><br/>
    <aura:iteration items="1,2,3,4,5" var="item">
  
   	<ui:inputCheckbox value="{!v.select_all_obj.item}"/><br/>
  </aura:iteration>
    
    
     Select All :<ui:inputCheckbox click="{!c.checkallFromObj}"/><br/>
     <aura:iteration items="{!v.select_all_obj}" var="item">
>>{!item.value} :	<ui:inputCheckbox value="{!item.prop}"/><br/>
  </aura:iteration>

</aura:application>