package org.jbei.lib
{
	import org.jbei.bio.data.Segment;

	public class FindUtils
	{
		public static function findAll(dnaSequence:String, expression:String, circular:Boolean = false):Array /* of Segment */
		{
			var result:Array = new Array();
			
			var sequenceLength:int = dnaSequence.length;
			
			if(expression.length == 0 || sequenceLength == 0) { return result; }
			
			var expressionRegExp:RegExp = new RegExp(expression, "ig");
			
			var extendedSequence:String = dnaSequence;
			if(circular) { // double sequence for circular search
				extendedSequence += extendedSequence;
			}
			
			var match:Object = expressionRegExp.exec(extendedSequence);
			while (match != null) {
				var matchStart:int = match.index;
				var matchEnd:int = match.index + String(match[0]).length;
				
				if(circular) { // circular search
					if (matchStart < sequenceLength && matchEnd <= sequenceLength) {
						result.push(new Segment(matchStart, matchEnd));
					} else if (matchStart < sequenceLength && matchEnd >= sequenceLength) {
						result.push(new Segment(matchStart, matchEnd - sequenceLength));
					}
				} else {
					result.push(new Segment(matchStart, matchEnd));
				}
				
				match = expressionRegExp.exec(extendedSequence);
			}
			
			return result;
		}
	}
}
