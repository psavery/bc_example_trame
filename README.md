Setup
=====

1. First, run the `build.sh` script to create the docker image we need.

2. Next, clone the repository at https://github.com/ubccr/hpc-toolset-tutorial

3. In hpc-toolset-tutorial, change every instance of `ubccr/hpcts:slurm-${HPCTS_VERSION}` in the docker-compose.yml file to be `$USER/trame-ood-cpn` .

4. In hpc-toolset-tutorial, optionally remove `mongodb`, `coldfront`, and `xdmod` from the docker-compose.yml file. They are not needed.

5. In hpc-toolset-tutorial, comment out `docker-compose pull` in the `hpcts` file. Then run `docker-compose pull` anyways to make sure you have all of the images.

6. In hpc-toolset-tutorial, run `./hpcts start`. This starts the docker containers.

7. Open a web browser to `https://localhost:3443`, and log in as `hpcadmin` with a password of `ilovelinux`.

8. Navigate to "Develop"->"My Sandbox Apps (Development)", and you should see a jupyter app and a trame app there. Feel free to run them (you do not need to set an account or a partition).
