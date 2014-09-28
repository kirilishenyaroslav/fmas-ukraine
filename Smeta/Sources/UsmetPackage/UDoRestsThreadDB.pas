unit UDoRestsThreadDB;

interface

uses
  Classes, Forms,pFibDataSet,cxTextEdit,ComCtrls,pFibStoredProc,Windows,Dialogs;

type
  TDoRestsThreadDB = class(TThread)
  private
    { Private declarations }
    Form:TForm;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean; Form:TForm);overload;
  end;

implementation

uses UDoRests,DateUtils,SysUtils,GlobalSpr, cxCalendar;


constructor TDoRestsThreadDB.Create(CreateSuspended: Boolean; Form:TForm);
begin
    inherited Create(true);
    self.Form:=Form;
end;


procedure TDoRestsThreadDB.Execute;
begin
end;

end.
