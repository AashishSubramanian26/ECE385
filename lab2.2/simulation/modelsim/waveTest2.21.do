view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 10 -starttime 0ps -endtime 1000ps sim:/Processor/LoadA 
wave create -driver freeze -pattern constant -value 00 -starttime 0ps -endtime 1000ps sim:/Processor/LoadB 
WaveCollapseAll -1
wave clipboard restore
