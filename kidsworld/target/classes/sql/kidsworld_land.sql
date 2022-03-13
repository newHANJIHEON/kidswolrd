CREATE TABLE IF NOT EXISTS kidslandUser(
    uNum int(7) ZEROFILL NOT NULL PRIMARY KEY AUTO_INCREMENT,
    uId VARCHAR(200) UNIQUE NOT NULL,
    uPassword VARCHAR(200) NOT NULL,
    uName VARCHAR(20) NOT NULL,
    uPhoneNum VARCHAR(50) UNIQUE NOT NULL,
    uBirth VARCHAR(20) NOT NULL,
    uPostCode VARCHAR(20) NOT NULL,
    uAddr VARCHAR(200) NOT NULL,
    uDetailAddr VARCHAR(200) NOT NULL,
    regdate TIMESTAMP NOT NULL DEFAULT NOW(),
    updatedate TIMESTAMP,
    visitdate TIMESTAMP,
    member CHAR NOT NULL DEFAULT 'Y'
);

CREATE TABLE IF NOT EXISTS kidslandUserAuth(
    uId VARCHAR(200) PRIMARY KEY NOT NULL,
    uAuth VARCHAR(200) NOT NULL,
    FOREIGN KEY(uId) REFERENCES kidslandUser(uId)
);


CREATE TABLE IF NOT EXISTS kidslandTicket(
    tNum INT(7) ZEROFILL NOT NULL PRIMARY KEY AUTO_INCREMENT,
    forWho VARCHAR(50) NOT NULL,
    forWhen VARCHAR(50) NOT NULL,
    uName VARCHAR(50) NOT NULL,
    uPhoneNum VARCHAR(50) NOT NULL,
    uId VARCHAR(200) not null,
    market VARCHAR(50) NOT NULL,
    tArea VARCHAR(50) NOT NULL,
    used CHAR NOT NULL DEFAULT 'N',
    sellDate TIMESTAMP NOT NULL DEFAULT NOW(),
    useDate TIMESTAMP,
    FOREIGN KEY(uId) REFERENCES kidslandUser(uId),
    FOREIGN KEY(uPhoneNum) REFERENCES kidslandUser(uPhoneNum)
);


# DROP TABLE kidslandUserAuth;
# DROP TABLE kidslandUser;
# DROP TABLE kidslandTicket;


SELECT * FROM kidslandUser;
SELECT * FROM kidslandTicket;

SELECT * FROM kidslandTicket WHERE uPhoneNum LIKE '%1693' AND uName = '한지헌';
SELECT * FROM kidslandTicket WHERE uPhoneNum LIKE '%1693' ORDER BY used;

SELECT * FROM kidslandTicket WHERE sellDate BETWEEN '2021-02-20' AND '2022-02-21';

INSERT INTO kidslandUser(uId, uPassword, uName, uPhoneNum, uBirth, uPostCode, uAddr, uDetailAddr)
VALUES('jejetwo123@naver.com', '0408jhjh', '한지헌', '01077591693', '19960408', '48572', '부산광역시 남구 용호로 198번길 39', '동방파크 3동 108호');

INSERT INTO kidslandTicket(uName, forWhen, forWho, uPhoneNum, uId, market, tArea)
VALUES('한지헌', '오후권', '성인', '01077591693', 'jejetwo123@naver.com', '홈페이지', '부산벡스코');

INSERT INTO kidslandTicket(uName, forWhen, forWho, uPhoneNum, uId, market, tArea, sellDate)
VALUES('한지헌', '오후권', '성인', '01077591693', 'jejetwo123@naver.com', '홈페이지', '부산벡스코', '2021-02-20');

UPDATE kidslandTicket SET used = 'Y' WHERE tNum = 1 OR tNum = 2;

INSERT INTO kidslandUserAuth(uId, uAuth) VALUES('jejetwo123@naver.com', 'RULE_MASTER');

SELECT kidslandUser.*, kidslandUserAuth.uAuth FROM kidslandUser LEFT OUTER JOIN kidslandUserAuth
                                                                                on kidslandUser.uId = kidslandUserAuth.uId WHERE kidslandUser.uId = 'jejetwo123@naver.com' AND kidslandUser.member = 'Y';

CREATE TABLE IF NOT EXISTS kidslandNotice(
    nNum INT(4) ZEROFILL NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nCategory VARCHAR(20) NOT NULL,
    nWriter VARCHAR(20) NOT NULL,
    nTitle VARCHAR(50) NOT NULL,
    nContent text NOT NULL,
    nDate TIMESTAMP default NOW() NOT NULL,
    nDelete CHAR default 'N'
);

DROP TABLE kidslandNotice;

INSERT INTO kidslandNotice(nCategory, nWriter, nTitle, nContent) VALUES('일반공지', '관리자', '테스트11', '테스트12');

CREATE TABLE IF NOT EXISTS kidslandQna(
  qNum INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  qTitle VARCHAR(200) NOT NULL,
  qWriter VARBINARY(20) NOT NULL,
  qContent LONGTEXT NOT NULL,
  origin INT NOT NULL default 0,
  depth INT NOT NULL default 0,
  seq INT NOT NULL default 0,
  qDate TIMESTAMP NOT NULL DEFAULT NOW(),
  qDelete CHAR(1) NOT NULL DEFAULT 'N',
  qUserNum INT(7) ZEROFILL NOT NULL,
  Foreign Key(qUserNum) REFERENCES kidslandUser(uNum)
);

drop table kidslandQna;

SELECT * FROM kidslandTicket WHERE DATE(useDate) = DATE(NOW());

SELECT * FROM kidslandTicket WHERE DATE(useDate) = '2022-03-10';

CREATE TABLE IF NOT EXISTS kidslandReview(
    rNum INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    rTitle VARCHAR(200) NOT NULL,
    rWriter VARBINARY(20) NOT NULL,
    rPoint INT NOT NULL NOT NULL,
    rContent LONGTEXT NOT NULL,
    rDate TIMESTAMP NOT NULL DEFAULT NOW(),
    rDelete CHAR(1) NOT NULL DEFAULT 'N',
    rUserNum INT(7) ZEROFILL NOT NULL,
    FOREIGN KEY(rUserNum) REFERENCES kidslandUser(uNum)
);

use smartWeb;

drop table kidslandReview;

SELECT * FROM kidslandReview WHERE rDelete = 'N' ORDER BY rPoint;