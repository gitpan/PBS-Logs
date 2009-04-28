# the acct.20050201 data joined and put into an array
@data = (
qq{02/01/2005 10:23:18 | Q | 19.davinci | queue=workq},
qq{02/01/2005 10:23:18 | S | 19.davinci | user=gonwat group=mpccc jobname=n queue=workq ctime=1107282198 qtime=1107282198 etime=1107282198 start=1107282198 exec_host=davinci/0*4 Resource_List.mem=500mb Resource_List.ncpus=4 Resource_List.walltime=00:25:00 },
qq{02/01/2005 10:23:19 | E | 19.davinci | user=gonwat group=mpccc jobname=n queue=workq ctime=1107282198 qtime=1107282198 etime=1107282198 start=1107282198 exec_host=davinci/0*4 Resource_List.mem=500mb Resource_List.ncpus=4 Resource_List.walltime=00:25:00 session=8569 end=1107282199 Exit_status=255 resources_used.cpupercent=0 resources_used.cput=00:00:00 resources_used.mem=3584kb resources_used.ncpus=4 resources_used.vmem=10096kb resources_used.walltime=00:00:00},
qq{02/01/2005 11:06:18 | Q | 20.davinci | queue=workq},
qq{02/01/2005 11:06:18 | S | 20.davinci | user=gonwat group=mpccc jobname=n queue=workq ctime=1107284778 qtime=1107284778 etime=1107284778 start=1107284778 exec_host=davinci/0*4 Resource_List.mem=500mb Resource_List.ncpus=4 Resource_List.walltime=00:25:00 },
qq{02/01/2005 11:06:18 | E | 20.davinci | user=gonwat group=mpccc jobname=n queue=workq ctime=1107284778 qtime=1107284778 etime=1107284778 start=1107284778 exec_host=davinci/0*4 Resource_List.mem=500mb Resource_List.ncpus=4 Resource_List.walltime=00:25:00 session=15040 end=1107284778 Exit_status=255 resources_used.cpupercent=0 resources_used.cput=00:00:00 resources_used.mem=2880kb resources_used.ncpus=4 resources_used.vmem=6848kb resources_used.walltime=00:00:00},
qq{02/01/2005 11:56:09 | Q | 26.davinci | queue=workq},
qq{02/01/2005 11:56:10 | S | 26.davinci | user=carjert group=ccc jobname=junk.pbs queue=workq ctime=1107287769 qtime=1107287769 etime=1107287769 start=1107287770 exec_host=davinci/0*4 Resource_List.mem=500mb Resource_List.ncpus=4 Resource_List.walltime=00:25:00 },
qq{02/01/2005 11:56:10 | E | 26.davinci | user=carjert group=ccc jobname=junk.pbs queue=workq ctime=1107287769 qtime=1107287769 etime=1107287769 start=1107287770 exec_host=davinci/0*4 Resource_List.mem=500mb Resource_List.ncpus=4 Resource_List.walltime=00:25:00 session=16607 end=1107287770 Exit_status=0 resources_used.cpupercent=0 resources_used.cput=00:00:00 resources_used.mem=4864kb resources_used.ncpus=4 resources_used.vmem=17600kb resources_used.walltime=00:00:00},
qq{02/01/2005 18:48:10 | Q | 41.davinci | queue=workq},
qq{02/01/2005 18:48:10 | S | 41.davinci | user=carjert group=ccc jobname=madbench.pbs queue=workq ctime=1107312490 qtime=1107312490 etime=1107312490 start=1107312490 exec_host=davinci/0*4 Resource_List.mem=500mb Resource_List.ncpus=4 Resource_List.walltime=00:10:00 },
qq{02/01/2005 18:48:11 | E | 41.davinci | user=carjert group=ccc jobname=madbench.pbs queue=workq ctime=1107312490 qtime=1107312490 etime=1107312490 start=1107312490 exec_host=davinci/0*4 Resource_List.mem=500mb Resource_List.ncpus=4 Resource_List.walltime=00:10:00 session=19337 end=1107312491 Exit_status=255 resources_used.cpupercent=0 resources_used.cput=00:00:00 resources_used.mem=2352kb resources_used.ncpus=4 resources_used.vmem=8272kb resources_used.walltime=00:00:01},
);
@count = (0,1,5,12,13,17,24,25,29,36,37,41,-1);
@records = (
q{02/01/2005 10:23:18;Q;19.davinci;queue=workq},
q{02/01/2005 10:23:18;S;19.davinci;user=gonwat group=mpccc jobname=n queue=workq ctime=1107282198 qtime=1107282198 etime=1107282198 start=1107282198 exec_host=davinci/0*4 Resource_List.mem=500mb Resource_List.ncpus=4 Resource_List.walltime=00:25:00 },
q{02/01/2005 10:23:19;E;19.davinci;user=gonwat group=mpccc jobname=n queue=workq ctime=1107282198 qtime=1107282198 etime=1107282198 start=1107282198 exec_host=davinci/0*4 Resource_List.mem=500mb Resource_List.ncpus=4 Resource_List.walltime=00:25:00 session=8569 end=1107282199 Exit_status=255 resources_used.cpupercent=0 resources_used.cput=00:00:00 resources_used.mem=3584kb resources_used.ncpus=4 resources_used.vmem=10096kb resources_used.walltime=00:00:00},
q{02/01/2005 11:06:18;Q;20.davinci;queue=workq},
q{02/01/2005 11:06:18;S;20.davinci;user=gonwat group=mpccc jobname=n queue=workq ctime=1107284778 qtime=1107284778 etime=1107284778 start=1107284778 exec_host=davinci/0*4 Resource_List.mem=500mb Resource_List.ncpus=4 Resource_List.walltime=00:25:00 },
q{02/01/2005 11:06:18;E;20.davinci;user=gonwat group=mpccc jobname=n queue=workq ctime=1107284778 qtime=1107284778 etime=1107284778 start=1107284778 exec_host=davinci/0*4 Resource_List.mem=500mb Resource_List.ncpus=4 Resource_List.walltime=00:25:00 session=15040 end=1107284778 Exit_status=255 resources_used.cpupercent=0 resources_used.cput=00:00:00 resources_used.mem=2880kb resources_used.ncpus=4 resources_used.vmem=6848kb resources_used.walltime=00:00:00},
q{02/01/2005 11:56:09;Q;26.davinci;queue=workq},
q{02/01/2005 11:56:10;S;26.davinci;user=carjert group=ccc jobname=junk.pbs queue=workq ctime=1107287769 qtime=1107287769 etime=1107287769 start=1107287770 exec_host=davinci/0*4 Resource_List.mem=500mb Resource_List.ncpus=4 Resource_List.walltime=00:25:00 },
q{02/01/2005 11:56:10;E;26.davinci;user=carjert group=ccc jobname=junk.pbs queue=workq ctime=1107287769 qtime=1107287769 etime=1107287769 start=1107287770 exec_host=davinci/0*4 Resource_List.mem=500mb Resource_List.ncpus=4 Resource_List.walltime=00:25:00 session=16607 end=1107287770 Exit_status=0 resources_used.cpupercent=0 resources_used.cput=00:00:00 resources_used.mem=4864kb resources_used.ncpus=4 resources_used.vmem=17600kb resources_used.walltime=00:00:00},
q{02/01/2005 18:48:10;Q;41.davinci;queue=workq},
q{02/01/2005 18:48:10;S;41.davinci;user=carjert group=ccc jobname=madbench.pbs queue=workq ctime=1107312490 qtime=1107312490 etime=1107312490 start=1107312490 exec_host=davinci/0*4 Resource_List.mem=500mb Resource_List.ncpus=4 Resource_List.walltime=00:10:00 },
q{02/01/2005 18:48:11;E;41.davinci;user=carjert group=ccc jobname=madbench.pbs queue=workq ctime=1107312490 qtime=1107312490 etime=1107312490 start=1107312490 exec_host=davinci/0*4 Resource_List.mem=500mb Resource_List.ncpus=4 Resource_List.walltime=00:10:00 session=19337 end=1107312491 Exit_status=255 resources_used.cpupercent=0 resources_used.cput=00:00:00 resources_used.mem=2352kb resources_used.ncpus=4 resources_used.vmem=8272kb resources_used.walltime=00:00:01});