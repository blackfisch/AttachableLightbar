#define F(NAME,TARGET) class NAME { \
    allowedTargets = TARGET; \
};

#define ANYONE 0
#define CLIENT 1
#define SERVER 2

class CfgRemoteExec {
    class Functions {
        mode = 1;
        jip = 0;

        /* Blaulicht */
        F(bf_fnc_lightsOn,ANYONE)
        F(bf_fnc_siren,ANYONE)
    };
};
