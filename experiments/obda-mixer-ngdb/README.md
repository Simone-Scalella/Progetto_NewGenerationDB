# Folder Content

~~~
.
├── configuration-het-opt.conf
├── configuration-het-opt-matv.conf
├── configuration-hom.conf
├── configuration-hom-opt.conf
├── configuration-jdbc-mode.conf
├── configuration-sc1.conf
├── EXPLANATION.txt
├── logback.xml
├── obda-mixer.jar
├── README.md
├── results
├── Templates
├── TemplatesSQL-het-hom
├── TemplatesSQL-het-hom-opt
├── TemplatesSQL-het-hom-opt-matv
├── TemplatesSQL-sc1
├── TemplatesSQL-sc2
└── tester.sh
~~~

## How to Run

### Test a Single Profile
First, select the profile you want to test in the docker-compose file, and launch a `docker compose up`.
Once the container is up, run the corresponding bash procedure in `tester.sh`. For instance, to run the experiment over the heterogeneous profile with non-optimized queries, use procedure `het()`:

~~~
# Experiment over heterogeneous profile
het () {
    java -jar obda-mixer.jar --conf=configuration-het.conf &> results/mixer-out-het.txt
}
~~~

### Test All Profiles (Warning: Takes a LONG Time)

By launching the function `do_tests()` in `tester.sh`. If all sizes are uncommented in the outer `for` loop, then this test takes a very long time (about 1 week).

## Configurations Files (used by the procedures above).

File names ending with `opt` use the hints of empty federated joins and data redundancy. File names ending with `mat` use also materialized views.

- `configuration-het.conf`: heterogeneous profile
- `configuration-het-opt.conf`: heterogeneous profile, optimized queries
- `configuration-het-opt-matv.conf`: heterogeneous profile, optimized queries, materialized views
- `configuration-hom.conf`: homogeneous profile
- `configuration-hom-opt.conf`: homogeneous profile, optimized queries
- `configuration-hom-opt-matv.conf`: homogeneous profile, optimized queries, materialized view

## `TemplatesXYZ` Folders

`TemplatesXYZ` folders contain the _query templates_ used by the `obda-mixer`. At each run, `obda-mixer` will instantiate these templates into actual queries. Here, templates `01.q`-`12.q` correspond to the SPARQL queries in the BSBM  benchmark, and `00.q` is a simple template designed by us for testing purposes. The `TemplatesSQL-XYZ` folders contain the SQL translations of the templates in the `Templates` folder, obtained manually starting from an unfolding by the `Ontop` OBDA system.

- `Templates`: SPARQL Query templates for all the being tested queries
- `TemplatesSQL-het-hom`: SQL Query templates for heterogeneous and homogeneous settings, no optimizations. Note that the homogeneous and heterogeneous situation use the same VDB, so the test queries are the same.
- `TemplatesSQL-het-hom-opt`: SQL Query templates for heterogeneous and homogeneous settings, with optimizations.
- `TemplatesSQL-het-hom-opt-matv`: SQL Query templates for heterogeneous and homogeneous settings, with optimizations and materialized views.
- `TemplatesSQL-sc1`: SQL query templates for setting s1.
- `TemplatesSQL-sc2`: SQL query templates for setting s2.

## `results` Folder

This folder contains both the outputs and the collected statistics for the evaluations reported in the paper.
