{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с оборотами                             }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uMatasSchOborotMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxSpinEdit, ibase,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  uResources, uMatasVars, uMatasUtils, ActnList, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery, pFIBStoredProc, DateUtils;

type
  TSchOborotForm = class(TForm)
    Label1: TLabel;
    cxMonthBeg: TcxComboBox;
    cxYearBeg: TcxSpinEdit;
    Label5: TLabel;
    cxMonthEnd: TcxComboBox;
    cxYearEnd: TcxSpinEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    ActionOk: TAction;
    WorkDatabase: TpFIBDatabase;
    WorkTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionCancelExecute(Sender: TObject);
  private
    { Private declarations }
    DBHANDLE:TISC_DB_HANDLE;
  public
   YearBeg, YearEnd, MonthBegNumber, MonthEndNumber   :Word;
   MonthBeg,MonthEnd  :String;
   ID_SESSION: integer;

   constructor Create(aOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);overload;
  end;

  procedure ShowSchCommonOborot(aOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);stdcall;

  exports ShowSchCommonOborot;

var
  SchOborotForm: TSchOborotForm;

implementation

{$R *.dfm}

procedure ShowSchCommonOborot(aOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);stdcall;
begin
 TSchOborotForm.Create(aOwner, DBHANDLE);
end;

constructor TSchOborotForm.Create(aOwner:TComponent;DBHANDLE : TISC_DB_HANDLE);
var
 dy, dm, dd: Word;
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.WorkDatabase.Close;
   Self.WorkDatabase.Handle:=DBHANDLE;
   Self.Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_ACC_SCH_OB;
   DecodeDate(_MATAS_PERIOD, dy, dm,  dd);
   LoadMonthTocxComboBox(self.cxMonthBeg);
   LoadMonthTocxComboBox(self.cxMonthEnd);
   self.OkButton.Caption:=MAT_ACTION_VIEW_CONST;
   self.CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
   self.cxMonthBeg.ItemIndex:=dm-1;
   self.cxYearBeg.Value:=dy;
   self.cxMonthEnd.ItemIndex:=dm-1;
   self.cxYearEnd.Value:=dy;
 end;
 self.ID_SESSION:=0;
end;

procedure TSchOborotForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TSchOborotForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TSchOborotForm.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

end.
