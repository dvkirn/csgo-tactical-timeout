#include <sourcemod>
#include <cstrike>

public Plugin myinfo =
{
    name = "Tactical Timeouts",
    author = "dvkirn",
    description = "Allows tac timeouts with .tac command",
    version = "1.0",
    url = "tbd"
};

public void OnPluginStart()
{
    RegConsoleCmd("sm_tactical", Command_Timeout, "Start Team Timeout");
    PrintToServer("Tactical Timeouts Enablded!");
}

public Action Command_Timeout(client, args)
{
    if (GetClientTeam(client) == CS_TEAM_T) {
        ServerCommand("timeout_terrorist_start");
        PrintToChatAll("[Timeout] start timeout for (T) team", client);

        return Plugin_Handled;
    }

    if (GetClientTeam(client) == CS_TEAM_CT) {
        ServerCommand("timeout_ct_start");
        PrintToChatAll("[Timeout] start timeout for (CT) team", client);

        return Plugin_Handled;
    }

    return Plugin_Continue;
}



