# Basic jobs

```{important}
With great power comes great responsibility. These computing resources cost money. Don't hestitate to use 1 node for 1
hour to test things. But don't request 100 nodes for 10 days unless you know what you're doing. The SMCE nodes are
large, expensive nodes.
```

As noted in [the platform overview documentation](./platform_overview.md), the SMCE acts as a HPC with SLURM as the
workload manager. You request a job with some specified computing resources, SLURM will spin-up nodes that meet those
requirements, and then run your job on those nodes.

## Minimal job

Let's start with a minimal job that will simply have a script that counts up for 60 seconds. A SLURM script is just a
bash script with some special `#SBATCH` comments that explain to SLURM what resources and configuration you want.
The remainder of the script runs mostly as normal. Save the following script as `minimal_job_example.bash`.
```bash
#!/bin/bash

#SBATCH --job-name=minimal_job
#SBATCH --partition=roman-c5n18xlarge-od
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=0
#SBATCH --time=00:02:00

for iteration in {1..60}
do
    echo $iteration
    sleep 1
done
```
`--job-name` is the name your job will have in SLURM. `--partition` is the partition you're requesting resources from. Each node that's available to use is grouped into one or more partitions. On the SMCE, specify the partition basically means specifying a specific type of node. `--ntasks` is the number of tasks. This is the number of copies of your script that get started. For now we're just creating one, but when you have multiple things that need to work in parallel (either independently or communicating with one another) you can increase this number (more on this in later examples). `--cpus-per-task` is the number of CPU cores we're requesting for each task. `--mem-per-cpu` is the memory per core we're requesting. `--mem-per-cpu=0` looks a bit odd. We could specify something like `--mem-per-cpu=500M` to request 500MB of memory per core requested. However, setting this value to `0` will request the "fair share" of the node's memory that goes with a single CPU core. That is, it sets `mem-per-cpu` to the total memory of the node divided by the total cores of the node. `--time` is the maximum wall-time job will be allowed to run for before SLURM will shut it down, regardless of if it has finished. The wall-time is in the format of `hours:minutes:seconds` with `00:02:00` being 2 minutes. You can also use `days-hours:minutes:seconds`. So `1-00:00:00` would request 1 day of time. [There are an enormous number of other possible parameters that can be specified](https://slurm.schedmd.com/sbatch.html) including different ways of specifying the above values (e.g., total memory instead of memory per core).

Put the above into a script called `minimal_job_example.bash`, and then run it using
```sh
sbatch minimal_job_example.bash
```
This will add the job to the SLURM job queue and print out the job ID number. While in normal HPC centers you would need to wait until hardware becomes available for your job to run, the SMCE is cloud-based, and will expand based on the need, so your job should start shortly. You can list the running jobs and jobs waiting to start with
```sh
squeue --long
```
If your job is waiting to run or currently running, you'll see something like
```
Thu Aug 28 00:04:37 2025
     JOBID PARTITION     NAME     USER    STATE       TIME TIME_LIMI  NODES NODELIST(REASON)
      2089 roman-c5n minimal_ golmsche  RUNNING       0:05      2:00      1 roman-c5n18xlarge-od-dy-c5n18xlarge-1
```
```{note}
You may see your job in the `CONFIGUR` state. As of 2025-08-27, it takes the SMCE about 5 minutes to prepare the nodes for your job. Other HPC clusters I've used (on hardware not in the cloud) would start running in seconds. This 5 minute delay may or may not change in the future.
```
The stdout and stderr of your job will (by default) be written to a file named `slurm-<your_job_id>.out`. Here you will see the numbers printing from 1 to 60.
