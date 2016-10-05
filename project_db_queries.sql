1.
select * from project, tech;

2.
select * from project left outer join project_uses_tech on project.id = project_id;

3.
SELECT * from tech left outer join project_uses_tech on tech.id = tech_id;

4.
SELECT * from project left outer join project_uses_tech on project.id = project_id left outer join tech on tech_id = tech.id;

5.
SELECT project.name, count(tech.name) from project left outer join project_uses_tech on project.id = project_id left outer join tech on tech_id = tech.id GROUP BY project.name;

6.
SELECT tech.name, count(project_uses_tech.project_id) from tech left outer join project_uses_tech on tech.id = tech_id GROUP BY tech.name;

7.
SELECT project.name, count(tech_id) AS count_of_tech from project inner join project_uses_tech on project.id = project_id GROUP BY project.name ORDER BY count(tech_id) DESC;

8.
SELECT tech.name, count(project_id) AS count_of_projects from tech INNER JOIN project_uses_tech on tech.id = tech_id GROUP BY tech.name ORDER BY count(project_id) DESC;

9.
SELECT project.name, count(tech_id) AS count_of_tech from project inner join project_uses_tech on project.id = project_id GROUP BY project.name ORDER BY count(tech_id) DESC;

10.
SELECT avg(count_of_tech) FROM (SELECT project.name, count(tech_id) AS count_of_tech from project inner join project_uses_tech on project.id = project_id GROUP BY project.name ORDER BY count(tech_id) DESC) as tech_count;
