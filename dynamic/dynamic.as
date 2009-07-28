import mx.rpc.events.ResultEvent;
import mx.rpc.events.FaultEvent;
import mx.controls.Alert;

private function resultHandler(event:ResultEvent):void
{
	result.text = String(event.result);
}

private function faultHandler(event:FaultEvent):void
{
	Alert.show(event.fault.faultString);

}
