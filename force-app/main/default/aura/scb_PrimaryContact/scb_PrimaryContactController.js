({
	myAction : function(component, event, helper) {
        component.set("v.Columns", [
            {label:"Name", fieldName:"contactName", type:"text"},
            {label:"Email", fieldName:"contactEmail", type:"email"},
            {label:"Phone", fieldName:"contactPhone", type:"phone"}
        ]);
        var action = component.get("c.getContactWrappers");
        action.setParams({
            recordId: component.get("v.recordId"),
            role: component.get("v.Role")
        });
        action.setCallback(this, function(data) {
            component.set("v.ContactWrappers", data.getReturnValue());
        });
        $A.enqueueAction(action);
	}
})