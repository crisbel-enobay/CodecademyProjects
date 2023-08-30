-- 1. Examine the data from the employees table
SELECT *
FROM employees
LIMIT 10;
-- 2. Do you think there’s a way to join the two tables?
SELECT *
FROM projects;
-- 3. What are the names of employees who have not chosen a project?
SELECT first_name,
    last_name,
    current_project
FROM employees
WHERE current_project IS NULL;
-- 4. What are the names of projects that were not chosen by any employees?
SELECT project_name
FROM projects
WHERE project_id NOT IN(
        SELECT current_project
        FROM employees
        WHERE current_project IS NOT NULL
    );
-- 5. What are the names of project chosen by the most employees?
SELECT p.project_name,
    e.current_project AS 'the_most_chosen_project'
FROM projects p
    INNER JOIN employees e ON p.project_id = e.current_project
GROUP BY 1
ORDER BY COUNT(e.current_project) DESC
LIMIT 1;
--6. Which projects were chosen by multiple employees?
SELECT p.project_name,
    e.current_project
FROM projects p
    INNER JOIN employees e ON p.project_id = e.current_project
GROUP BY 1
HAVING COUNT(e.current_project) > 1
ORDER BY 2 DESC;
-- 7. Each projects needs 2 developers, extracting the developers who currently have projects, how many developers are still needed?
SELECT (COUNT(*) * 2) - (
        SELECT COUNT(*)
        FROM employees
        WHERE current_project IS NOT NULL
            AND position = 'Developer'
    ) AS 'Count'
FROM projects;
-- 8. personality incompatibility
SELECT personality AS 'personality_type',
    CASE
        WHEN personality IN ('INFP', 'ENFP', 'INFJ') THEN 'ISFP, ESFP, ISTP, ESTP, ISFJ, ESFJ, ISTJ, ESTJ'
        WHEN personality = 'ENFJ' THEN 'ESFP, ISTP, ESTP, ISFJ, ESFJ, ISTJ, ESTJ'
        WHEN personality = 'ISFP' THEN 'INFP, ENFP, INFJ'
        WHEN personality IN ('ESFP', 'ESTP', 'ISTP', 'ISFJ', 'ESFJ', 'ISTJ', 'ESTJ') THEN 'INFP, ENFP, INFJ, ENFJ'
        ELSE 'COMPATIBLE WITH ALL'
    END AS 'incompatibility'
FROM employees;
-- 9. Which personality is the most common across our employees?
SELECT personality,
    COUNT(personality) AS 'most_common_personality'
FROM employees
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
-- 10. What are the names of projects chosen by employees with the most common personality type?
SELECT personality,
    project_name
FROM projects
    INNER JOIN employees ON projects.project_id = employees.current_project
WHERE personality = (
        SELECT personality
        FROM employees
        GROUP BY personality
        ORDER BY COUNT(personality) DESC
        LIMIT 1
    )
ORDER BY 2;
-- 11. Get names, personality and project names of people with existing project and with most personality type.
SELECT first_name,
    last_name,
    personality,
    project_name
FROM employees
    INNER JOIN projects ON employees.current_project = projects.project_id
WHERE personality = (
        SELECT personality
        FROM employees
        WHERE current_project IS NOT NULL
        GROUP BY 1
        ORDER BY COUNT(personality) DESC
        LIMIT 1
    )
ORDER BY 1;
-- 12. Get employee name, personality, name of current project, number of incompatible co-worker based on personality
SELECT first_name,
    last_name,
    personality,
    project_name,
    CASE
        WHEN personality IN ('INFP', 'ENFP', 'INFJ') THEN (
            SELECT COUNT(*)
            FROM employees
            WHERE personality IN (
                    'ISFP',
                    'ESFP',
                    'ISTP',
                    'ESTP',
                    'ISFJ',
                    'ESFJ',
                    'ISTJ',
                    'ESTJ'
                )
        )
        WHEN personality = 'ENFJ' THEN (
            SELECT COUNT(*)
            FROM employees
            WHERE personality IN (
                    'ESFP',
                    'ISTP',
                    'ESTP',
                    'ISFJ',
                    'ESFJ',
                    'ISTJ',
                    'ESTJ'
                )
        )
        WHEN personality = 'ISFP' THEN (
            SELECT COUNT(*)
            FROM employees
            WHERE personality IN ('INFP', 'ENFP', 'INFJ')
        )
        WHEN personality IN ('ESFP', 'ESTP', 'ISTP', 'ISFJ', 'ESFJ', 'ISTJ', 'ESTJ') THEN (
            SELECT COUNT(*)
            FROM employees
            WHERE personality IN ('INFP', 'ENFP', 'INFJ', 'ENFJ')
        )
        ELSE 0
    END AS 'total_of_incompatibility'
FROM employees
    LEFT JOIN projects ON employees.current_project = projects.project_id
ORDER BY 5;