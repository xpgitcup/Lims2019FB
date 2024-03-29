INSERT INTO `query_statementa`
VALUES (1, 1, NULL, 'operation4QueryStatementA', _binary '\0', 'count', '[]',
        'select count(*) from QueryStatementA queryStatementA', 'QueryStatementA', NULL),
       (2, 3, NULL, 'operation4QueryStatementA', _binary '\0', 'list', '[max, offset]',
        'from QueryStatementA queryStatementA\r\norder by controllerName, actionName,keyString', 'QueryStatementA',
        'listQueryStatementA'),
       (9, 0, NULL, 'operation4SystemUser', _binary '\0', 'list', '[max, offset]', 'from SystemUser systemUser',
        'SystemUser', 'listSystemUser'),
       (10, 0, NULL, 'operation4SystemUser', _binary '\0', 'count', '[]', 'select count(*) from SystemUser systemUser',
        'SystemUser', NULL),
       (13, 0, NULL, 'operation4DataRootPath', _binary '\0', 'list', '[max, offset]', 'from DataRootPath dataRootPath',
        'DataRootPath', 'listDataRootPath'),
       (14, 0, NULL, 'operation4DataRootPath', _binary '\0', 'count', '[]',
        'select count(*) from DataRootPath dataRootPath', 'DataRootPath', NULL),
       (23, 6, NULL, 'operation4QueryStatementA', _binary '\0', 'list', '[max, offset]',
        'from QueryStatementA queryStatementA \r\nwhere queryStatementA.queryString=null\r\norder by controllerName, actionName,keyString',
        'QueryStatementA待编辑', 'listQueryStatementA'),
       (24, 2, NULL, 'operation4QueryStatementA', _binary '\0', 'count', '[]',
        'select count(*) from QueryStatementA queryStatementA\r\nwhere queryStatementA.queryString=null',
        'QueryStatementA待编辑', NULL),
       (25, 1, NULL, 'operation4QueryStatementA', _binary '\0', 'count', '[like]',
        'select count(*) from QueryStatementA queryStatementA\r\nwhere queryStatementA.keyString like :like',
        'QueryStatementA', NULL),
       (26, 2, NULL, 'operation4QueryStatementA', _binary '\0', 'list', '[like, max, offset]',
        'from QueryStatementA queryStatementA \r\nwhere queryStatementA.keyString like :like\r\norder by controllerName, actionName,keyString',
        'QueryStatementA', 'listQueryStatementA'),
       (27, 1, NULL, 'home', _binary '\0', 'list', '[max, offset]',
        'from SystemStatus systemStatus\r\norder by loginTime desc', '登录-登录前', 'listSystemStatus'),
       (28, 2, NULL, 'home', _binary '\0', 'count', '[]', 'select count(*) from SystemStatus systemStatus', '登录-登录前',
        NULL),
       (35, 2, NULL, 'home', _binary '\0', 'list', '[max, offset]', 'from Progress progress \r\norder by regDate desc',
        '进度-登录前', 'listProgressHome'),
       (36, 1, NULL, 'home', _binary '\0', 'count', '[]', 'select count(*) from Progress progress', '进度-登录前', NULL),
       (43, 2, NULL, 'home', _binary '\0', 'list', '[max, offset, startDate]',
        'from Progress progress where progress.regDate>:startDate\r\norder by regDate desc', '近7天进度-登录前',
        'listProgressHome'),
       (44, 3, NULL, 'home', _binary '\0', 'count', '[startDate]',
        'select count(*) from Progress progress\r\nwhere progress.regDate>:startDate', '近7天进度-登录前', NULL),
       (45, 1, NULL, 'home', _binary '\0', 'count', '[startDate]',
        'select count(*) from SystemStatus systemStatus\r\nwhere loginTime>:startDate', '近7天登录-登录前', NULL),
       (46, 1, NULL, 'home', _binary '\0', 'list', '[max, offset, startDate]',
        'from SystemStatus systemStatus where loginTime>:startDate\r\norder by loginTime desc', '近7天登录-登录前',
        'listSystemStatus');
