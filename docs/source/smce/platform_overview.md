# Platform overview

The [Science Managed Cloud Environment (SMCE)](https://smce.nasa.gov) is the primary platform for the RGES-PIT's large-scale computing needs. The SMCE is managed by the Roman Project and will also serve many of the computing needs of the Roman Project, the SOC, and the other PITs. It is also where the SOC will store Roman data, allowing the RGES-PIT direct access to data products.

The SMCE is hosted on [Amazon Web Services (AWS)](https://aws.amazon.com), the largest provider of cloud servers. The SMCE is able to spin up an arbitrary number of compute nodes (individual virtual machines that function as separate computers on the same network). The SMCE functions as a High-Performance Computing (HPC) center from the perspective of the user. That is, a service where a user can specify a job and request a set of computing resources to accomplish that job. The SMCE uses the [SLURM workload manager](https://slurm.schedmd.com/documentation.html) to handle job requests. Examples of making such requests are given in later tutorials.

```{image} smce_connection_overview.png
:width: 800px
```