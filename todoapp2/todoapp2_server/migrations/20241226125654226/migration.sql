BEGIN;


--
-- MIGRATION VERSION FOR todoapp2
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('todoapp2', '20241226125654226', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241226125654226', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
