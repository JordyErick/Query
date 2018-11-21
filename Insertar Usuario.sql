INSERT INTO usrsms.client(
            client, razon_social, ruc, address,
            creation_date, rate, status, swt_cut)
    VALUES ('SERCBANK', 'SERCBANK', 12345678, 'SERCBANK@SERCBANK.COM', '2018-10-15', 1,1,0);

SELECT * FROM usrsms.client;

INSERT INTO usrsms.corporates(
             name, username, password, email, virtual_line, 
            creation_date, status, client_id, logo,throughput)
    VALUES ( 'SERCBANK', 'SERCBANK', 'ADMINSERCBANK', 'SERCBANK@SERCBANK.COM', '123456789',  
            '2018-10-15', 1, 32, 'mowa.png',240);

SELECT * FROM usrsms.corporates where name='SERCBANK';

INSERT INTO usrsms.corporate_plan(
            corporate_id, plan_id, start_date, end_date, payment_due, 
            payment_due_date, creation_date, update_date, status)
    VALUES ( 349, 3, '2018-10-15 00:00:00', '2019-02-22 00:00:00', 15000, 
           '2019-02-22 00:00:00', '2019-02-22 00:00:00', '2018-02-22 00:00:00', 1);

"5";2;3;"2014-08-29 00:00:00";"2014-09-29 00:00:00";15000;"2014-09-30 00:00:00";"2014-08-29 13:12:46.263";"2014-08-29 13:15:20.748";3

 INSERT INTO usrsms.corporate_group(
             corporate_id, group_id, status)
    VALUES ('SERCBANK', 14, 1);
           
INSERT INTO usrsms.user_permissions(
            username, role)
    VALUES ( 'SERCBANK', 'corporativo');


select * from usrsms.user_permissions
