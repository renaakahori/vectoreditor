package org.jbei.registry.commands
{
	import org.jbei.registry.ApplicationFacade;
	import org.jbei.registry.proxies.EntriesServiceProxy;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class FetchEntryPermissionsCommand extends SimpleCommand
	{
		public override function execute(notification:INotification):void
		{
			var entriesProxy:EntriesServiceProxy = ApplicationFacade.getInstance().retrieveProxy(EntriesServiceProxy.NAME) as EntriesServiceProxy;
			
			entriesProxy.hasWritablePermissions(ApplicationFacade.getInstance().sessionId, ApplicationFacade.getInstance().entryId);
		}
	}
}