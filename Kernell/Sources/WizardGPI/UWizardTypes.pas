unit UWizardTypes;

interface

uses Kernel, Forms, Classes,pFibDatabase;

const MODE1_CONST  = 1;
      MODE11_CONST = 11;
      MODE21_CONST = 21;
      MODE22_CONST = 22;
      MODE3_CONST  = 3;


type
     //Процедурный тип, который будет использоваться
     //для реализации процедур, в которых будет заложена
     //логика "шагов" менеджера
     RunProc= function(AOwner:TComponent;
                       LOCAL_STRU:PWIZARD_GET_PROV_INFO;
                       Database:TpFibDatabase;
                       Transaction:TpFibTransaction;
                       PrevStep:Integer
                       ):Integer;

implementation

end.
