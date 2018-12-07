package drc.sound;

import lime.media.AudioBuffer;
import lime.media.AudioSource;
import lime.media.OpenALAudioContext;
import lime.media.openal.AL;
import lime._internal.backend.native.NativeAudioSource;

class DrcSound 
{
	private var innerData:AudioSource;
	
	private var context:OpenALAudioContext; 
	
	public function new(buffer:AudioBuffer) 
	{
		innerData = new AudioSource(buffer);
		
		innerData.play();
		
		//innerData.buffer.data
		
		context = @:privateAccess new OpenALAudioContext();
		
		
		
		//context.sourcef(innerData, context.PITCH, 0.5);
		
		var aux = AL.createAux();
		var fx = AL.createEffect();
		
		//AL.effecti(fx, AL.EFFECT_TYPE, AL.EFFECT_REVERB);
		//AL.effectf(fx, AL.REVERB_DECAY_TIME, 5.0);
		//AL.effectf(fx, AL.REVERB_GAIN, 0.4);
		AL.auxi(aux, AL.EFFECTSLOT_EFFECT, fx);
		
		//context.source3f(innerData, context.PITCH, 2, 0, 0);
		
		var backend:NativeAudioSource = @:privateAccess innerData.__backend;
		
		AL.source3i(backend, AL.AUXILIARY_SEND_FILTER, aux, 100, AL.FILTER_NULL);
	}
}