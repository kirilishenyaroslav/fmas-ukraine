{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с дополнительными функциями             }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit fmTools;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxListBox, ibase,
  StdCtrls, cxButtons, uPackageManager, uMatasVars, uMatasUtils, uResources,
  ActnList;

type
  TfrmTools = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxTools: TcxListBox;
    ActionList1: TActionList;
    Action1: TAction;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
   DBHANDLE : TISC_DB_HANDLE;
   constructor Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);overload;
  end;

  procedure ShowTools(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);stdcall;
  exports ShowTools;

var
  frmTools: TfrmTools;

implementation

{$R *.dfm}

uses uSchManager, uSchSaldo, uSchInvMna;

procedure ShowTools(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);stdcall;
begin
 TfrmTools.Create(aOwner, aDBHANDLE);
end;

constructor TfrmTools.Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 if Assigned(aDBHandle)
 then begin
   Self.DBHANDLE := aDBHandle;
 end;
end;


procedure TfrmTools.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmTools.OkButtonClick(Sender: TObject);
begin
 case cxTools.ItemIndex of
  0: SchSaldoManager(self.Owner, DBHANDLE, _CURRENT_USER_ID);
  1: SchManager(self.Owner, DBHANDLE, _CURRENT_USER_ID);
  2: SchInvMna(self.Owner, DBHANDLE, _CURRENT_USER_ID, 1);
  3: SchInvMna(self.Owner, DBHANDLE, _CURRENT_USER_ID, 2);
 end;
end;

procedure TfrmTools.FormCreate(Sender: TObject);
begin
 Caption:=MAT_SYS_PREFIX+MAT_FORMCAP_TOOLS;
 OkButton.Caption:=MAT_BUTTON_CHOOSE_CONST;
 CancelButton.Caption:=MAT_ACTION_CLOSE_CONST;
 with cxTools.Items do
 begin
  Clear;
  Add(MAT_STR_TOOLS_01_SCH_SALDO);
  Add(MAT_STR_TOOLS_02_SCH_MANAGER);
//  Add('Експорт інв.картотеки до залишків ТМЦ');
//  Add('Експорт картотеки МНА до залишків ТМЦ');
 end;
end;

procedure TfrmTools.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfrmTools.Action1Execute(Sender: TObject);
begin
 Close;
end;

end.
