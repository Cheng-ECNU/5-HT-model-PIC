COMMENT
  ipulse3.mod
  Generates a train of current pulses of variable amplitude
  User specifies dur (pulse duration), per (period, i.e. interval 
  between pulse onsets), and num (number of pulses).
  Ensures that period is longer than pulse duration.
  2/6/2002 NTC
  Modif AD, 11-2006 -> variable amplitudes stored in a vector;
      added DC current
ENDCOMMENT

DEFINE MAXPULSES 1000		: maximum number of pulses

NEURON {
	POINT_PROCESS DC_Rin
	RANGE dc, i , gi ,Vm , Rin
	ELECTRODE_CURRENT i
}

UNITS {
	(nA) = (nanoamp)
	(mV) = (millivolt)
	(uS) = (microsiemens)
}

PARAMETER {
	
	dc (nA)			: DC current
    Rin           
}

ASSIGNED {
	ival (nA)
	i  (nA)
    v		(mV)
    gi 	(uS)   
    Vm (mV)
}

INITIAL {
    
    Vm = -62
	i = 0
    gi = 0
	ival = dc

}
BREAKPOINT {
	i = ival
    if(v!=0) { gi = i/(v-Vm)
    Rin=1/gi} else{
        gi = 0
    }
   
}


