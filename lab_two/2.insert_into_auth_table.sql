insert into authorizations (user_email, password, userid)
values('er@mail.ru', 'fjsdfldf', (select id_user from users where surname = 'Сергеев'));

insert into authorizations (user_email, password, userid)
values('ftr@mail.ru', 'dsff', (select id_user from users where surname = 'Иванов'));

insert into authorizations (user_email, password, userid)
values('dtw@mail.ru', 'asffs', (select id_user from users where surname = 'Федоров'));

insert into authorizations (user_email, password, userid)
values('grt@mail.ru', 'afsaff', (select id_user from users where surname = 'Tomson'));