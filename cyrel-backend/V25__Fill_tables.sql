INSERT INTO users(id, email, firstname, lastname, type, birthday)
VALUES ('00000000-0000-0000-0000-000000000000', 'student', 'Firstname', 'Lastname', 0, '01/01/1970');

INSERT INTO students(id, student_id)
VALUES ('00000000-0000-0000-0000-000000000000', 0);

INSERT INTO groups(id, name, referent, parent, private)
VALUES (0, 'ING3', null, null, false);
INSERT INTO groups_tags(id, key, value)
VALUES (0, 'type', 'promo');

INSERT INTO groups(id, name, referent, parent, private)
VALUES (1, 'ING3 - ICC', '00000000-0000-0000-0000-000000000000', 0, false);
INSERT INTO groups_tags(id, key, value)
VALUES (1, 'type', 'group');

DO
$$
    BEGIN
        FOR i IN 22000000..24000000
            LOOP
                INSERT INTO cytech_students VALUES (i);
            END LOOP;
    END;
$$;


INSERT INTO conf(id, value) VALUES ('webhook_url', 'https://discord.com/api/webhooks/1311098184629485678/q50Bp3OKf__kML3-Gi7hICv9tlJaCecQGjdzEHYF2Oy6Mm_zFVcWvjf18zdpuZ6ZTJg7');
INSERT INTO conf(id, value) VALUES ('ical_private_key', '0582a88ff900f42ed01d9770657e61aee360f95cdfd903be38d507f71ec66d92');
