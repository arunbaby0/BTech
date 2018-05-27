
#include <afxwin.h>
#include "dynam.h"

extern "C"
int PASCAL EXPORT addem(int value1, int value2)
{                 
    return value1 + value2;
}

class CDynamDLL : public CWinApp
{
public:
    virtual BOOL InitInstance(); 
    virtual int ExitInstance();  

    CDynamDLL(LPCTSTR pszAppName) : CWinApp(pszAppName){}
};

BOOL CDynamDLL::InitInstance()
{
    SetDialogBkColor();     
    return TRUE;
}

int CDynamDLL::ExitInstance()
{
    return CWinApp::ExitInstance();
}

CDynamDLL dyamDLL("dynam.dll");


