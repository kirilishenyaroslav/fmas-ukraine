unit uFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uResources, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxSpinEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, DB, FIBDataSet, pFIBDataSet, FR_Class, FR_DSet, FR_DBSet,
  cxCheckBox, FIBDatabase, pFIBDatabase, ibase, cxButtonEdit, uSpMatSch,
  uMatasVars, uMatasUtils, ActnList, GlobalSPR, FIBQuery, pFIBQuery,
  pFIBStoredProc, DateUtils;

function ShowFilter(aOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_SESSION: INT64; Flags:Variant):Variant;stdcall;

exports ShowFilter;

type
  TFilterMainForm = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    WorkDatabase: TpFIBDatabase;
    WorkTransaction: TpFIBTransaction;
    OperRepDataSet: TpFIBDataSet;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    ActionOk: TAction;
    CBDeb: TcxCheckBox;
    CBKred: TcxCheckBox;
    CBBut: TcxCheckBox;
    CBStatRoz: TcxCheckBox;
    CBKek: TcxCheckBox;
    BEDeb: TcxButtonEdit;
    BEKred: TcxButtonEdit;
    BEBut: TcxButtonEdit;
    BEStatRoz: TcxButtonEdit;
    BEKek: TcxButtonEdit;
    ClearButton: TcxButton;
    WorkStoredProc: TpFIBStoredProc;
    CBSch: TcxCheckBox;
    BESch: TcxButtonEdit;
    CBMol: TcxCheckBox;
    BEMol: TcxButtonEdit;
    CBNomn: TcxCheckBox;
    BENomn: TcxButtonEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure CBDebClick(Sender: TObject);
    procedure CBKredClick(Sender: TObject);
    procedure CBButClick(Sender: TObject);


    procedure CBDebPropertiesChange(Sender: TObject);
    procedure CBKredPropertiesChange(Sender: TObject);
    procedure CBButPropertiesChange(Sender: TObject);
    procedure CBStatRozPropertiesChange(Sender: TObject);
    procedure CBKekPropertiesChange(Sender: TObject);

    procedure BEDebPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BEKredPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BEKekPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BEButPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ApplyFilter;
    procedure BEStatRozPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ClearButtonClick(Sender: TObject);
    procedure CBNomnPropertiesChange(Sender: TObject);
    procedure CBMolPropertiesChange(Sender: TObject);
    procedure CBSchPropertiesChange(Sender: TObject);
    procedure BENomnPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BESchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);

  private
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;

  public
   Result : Variant;
   MatasMonth, MatasYear: Word;
   PERIOD: TDate;
   ID_SCH: integer;
   ID_SESSION:Integer;// содержит  идентификатор  сессии
   Res:Variant;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; _ID_SESSION: int64;_Flags:Variant);overload;
  end;

var
  FilterMainForm: TFilterMainForm;

implementation

{$R *.dfm}

function ShowFilter(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_SESSION : INT64;Flags:Variant):Variant ;stdcall;
var
  FM:TFilterMainForm;
  R:Variant;
begin
 FM:=TFilterMainForm.Create(AOwner, DBHANDLE, aID_SESSION,Flags);
 FM.FormStyle := fsNormal;
 FM.ShowModal;
 R:=FM.Result;
 ShowFilter:=R;
 FM.Free;
end;

procedure TFilterMainForm.CBMolPropertiesChange(Sender: TObject);
begin
 BEMol.Enabled:=CBNomn.Checked;
end ;

procedure TFilterMainForm.CBNomnPropertiesChange(Sender: TObject);
begin
 BENomn.Enabled:=CBNomn.Checked;
end;

constructor TFilterMainForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; _ID_SESSION: Int64;_Flags:Variant);
var
 dy, dm, dd: Word;
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.WorkDatabase.Close;
   Self.WorkDatabase.Handle:=DBHANDLE;
   //self.WorkDatabase.Open;
   Self.PERIOD:=_MATAS_PERIOD;
   //   Self.PERIOD:=StrToDate('30.12.2000');
   Self.Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_REP_OBR;
   DecodeDate(Self.PERIOD, dy, dm,  dd);
   MatasYear:=dy;
   MatasMonth:=dm;
   //LoadMonthTocxComboBox(self.cxMonth);
   //self.cxCopies.Value:=1;
   //self.cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
   //self.cxCheckBox1.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
   self.OkButton.Caption:=MAT_ACTION_PRINT_CONST;
   self.CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
   //self.cxMonth.ItemIndex:=MatasMonth-1;
   //self.cxYear.Value:=MatasYear;
   //---------------------------------------------------------------------------
     self.CBSch.Checked    :=_Flags[0];
     self.CBDeb.Checked    :=_Flags[1];
     self.CBKred.Checked   :=_Flags[2];
     self.CBMol.Checked    :=_Flags[3];
     self.CBBut.Checked    :=_Flags[4];
     self.CBStatRoz.Checked:=_Flags[5];
     self.CBKek.Checked    :=_Flags[6];
     self.CBNomn.Checked   :=_Flags[7];

     self.BESch.Enabled     :=_Flags[0];
     self.BEDeb.Enabled     :=_Flags[1];
     self.BEKred.Enabled    :=_Flags[2];
     self.BEMol.Enabled     :=_Flags[3];
     self.BEBut.Enabled     :=_Flags[4];
     self.BEStatRoz.Enabled :=_Flags[5];
     self.BEKek.Enabled     :=_Flags[6];
     self.BENomn.Enabled    :=_Flags[7];

     self.BESch.Text      :='';
     self.BEDeb.Text      :='';
     self.BEKred.Text     :='';
     self.BEMol.Text      :='';
     self.BEBut.Text      :='';
     self.BEStatRoz.Text  :='';
     self.BEKek.Text      :='';
     self.BENomn.Text     :='';

     ID_SESSION :=_ID_SESSION;
 end;
end;

procedure TFilterMainForm.ApplyFilter;
begin
 if CBDeb.Checked then
 begin
  OperRepDataSet.SelectSQL.Add('AND DB_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=6 AND ID_SESSION='+IntToStr(ID_SESSION)+')');
 end;
 if CBKred.Checked then
 begin
  OperRepDataSet.SelectSQL.Add('AND KR_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=7 AND ID_SESSION='+IntToStr(ID_SESSION)+')');
 end;
end;

procedure TFilterMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TFilterMainForm.CancelButtonClick(Sender: TObject);
begin
 Result:=VarArrayCreate([0,7], varVariant);
 Result[0]:=CBSch.Checked;
 Result[1]:=CBDeb.Checked;
 Result[2]:=CBKred.Checked;
 Result[3]:=CBMol.Checked;
 Result[4]:=CBBut.Checked;
 Result[5]:=CBStatRoz.Checked;
 Result[6]:=CBKek.Checked;
 Result[7]:=CBNomn.Checked;
 Close();
end;

procedure TFilterMainForm.FormCreate(Sender: TObject);
begin
 WorkTransaction.StartTransaction;
end;

procedure TFilterMainForm.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

procedure TFilterMainForm.CBDebClick(Sender: TObject);
begin
// BEDeb.Enabled:=CBDeb.Checked;
end;

procedure TFilterMainForm.CBKredClick(Sender: TObject);
begin
//  BEKred.Enabled:=CBKred.Checked;
end;

procedure TFilterMainForm.CBButClick(Sender: TObject);
begin
//  BEBut.Enabled:=CBDeb.Checked;
end;

procedure TFilterMainForm.CBDebPropertiesChange(Sender: TObject);
begin
 BEDeb.Enabled:=CBDeb.Checked;
end;

procedure TFilterMainForm.CBKredPropertiesChange(Sender: TObject);
begin
 BEKred.Enabled:=CBKred.Checked;
end;

procedure TFilterMainForm.CBButPropertiesChange(Sender: TObject);
begin
 BEBut.Enabled:=CBBut.Checked;
end;

procedure TFilterMainForm.CBStatRozPropertiesChange(Sender: TObject);
begin
 BEStatRoz.Enabled:=CBStatRoz.Checked;
end;

procedure TFilterMainForm.CBKekPropertiesChange(Sender: TObject);
begin
 BEKek.Enabled:=CBKek.Checked;
end;

procedure TFilterMainForm.BEDebPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 hPack     : HModule;
 SpravFunc : function (AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; _ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String):Variant;stdcall;
 R:Variant;
begin
 hPack := GetModuleHandle('ExtractUAddForm.bpl');
 if hPack < 32 then
  hPack := LoadPackage('ExtractUAddForm.bpl');
 if hPack > 0 then
  begin
   @SpravFunc := GetProcAddress(hPack, PCHAR('ShowAddForm'));
   if @SpravFunc <> NIL then
   begin
    R:=SpravFunc(Self,DBHANDLE,ID_SESSION,6,PERIOD,'дебету рахунків');
    BEDeb.Text:=VarToStr(R);
   end;
  end
 else
  begin
   ShowMessage(PChar('Error!'));
  end;
end;

procedure TFilterMainForm.BEKredPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
 hPack     : HModule;
 SpravFunc : function (AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; _ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String):Variant;stdcall;
 R:Variant;
begin
 hPack := GetModuleHandle('ExtractUAddForm.bpl');
 if hPack < 32 then
  hPack := LoadPackage('ExtractUAddForm.bpl');
 if hPack > 0 then
  begin
   @SpravFunc := GetProcAddress(hPack, PCHAR('ShowAddForm'));
   if @SpravFunc <> NIL then
   begin
   //(AOwner,DBHANDLE,_ID_SESSION,_ID_OBJECT,DATE_SESSION,NameForm);stdcall;
    R:=SpravFunc(Self,DBHANDLE,ID_SESSION,7,PERIOD,'кредиту рахунків');
    BEKred.Text:=VarToStr(R);
   end;
  end
 else
  begin
   ShowMessage(PChar('Error!'));
  end;
end;

procedure TFilterMainForm.BEKekPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
 hPack     : HModule;
 SpravFunc : function (AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; _ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String):Variant;stdcall;
 R:Variant;

begin
 hPack := GetModuleHandle('ExtractUAddForm.bpl');
 if hPack < 32 then
  hPack := LoadPackage('ExtractUAddForm.bpl');
 if hPack > 0 then
  begin
   @SpravFunc := GetProcAddress(hPack, PCHAR('ShowAddForm'));
   if @SpravFunc <> NIL then
   begin
    R:=SpravFunc(Self,DBHANDLE,ID_SESSION,10,PERIOD,'КЕКВам');
    BEKek.Text:=VarToStr(R);
   end;
  end
 else
  begin
   ShowMessage(PChar('Error!'));
  end;
end;

procedure TFilterMainForm.BEButPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
 hPack     : HModule;
 SpravFunc : function (AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; _ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String):Variant;stdcall;
 R:Variant;

begin
 hPack := GetModuleHandle('ExtractUAddForm.bpl');
 if hPack < 32 then
  hPack := LoadPackage('ExtractUAddForm.bpl');
 if hPack > 0 then
  begin
   @SpravFunc := GetProcAddress(hPack, PCHAR('ShowAddForm'));
   if @SpravFunc <> NIL then
   begin
   R:=SpravFunc(Self,DBHANDLE,ID_SESSION,8,PERIOD,'бюджетам');
   BEBut.Text:=VarToStr(R);
   end;
  end
 else
  begin
   ShowMessage(PChar('Error!'));
  end;
end;
procedure TFilterMainForm.BEStatRozPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
    var
 hPack     : HModule;
 SpravFunc : function (AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; _ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String):Variant;stdcall;
 R:Variant;

begin
 hPack := GetModuleHandle('ExtractUAddForm.bpl');
 if hPack < 32 then
  hPack := LoadPackage('ExtractUAddForm.bpl');
 if hPack > 0 then
  begin
   @SpravFunc := GetProcAddress(hPack, PCHAR('ShowAddForm'));
   if @SpravFunc <> NIL then
   begin
    R:=SpravFunc(Self,DBHANDLE,ID_SESSION,9,PERIOD,'статтям/розділам');
    BEStatRoz.Text:=VarToStr(R);
   end;
  end
 else
  begin
   ShowMessage(PChar('Error!'));
  end;
end;

procedure TFilterMainForm.ClearButtonClick(Sender: TObject);
begin

 try
   WorkTransaction.StartTransaction;
   WorkStoredProc.StoredProcName:='MAT_DEL_FROM_TMP_FLT_BY_SESSION';
   WorkStoredProc.Prepare;

   WorkStoredProc.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
   WorkStoredProc.ExecProc;
   WorkStoredProc.Transaction.Commit;

   except on E : Exception
   do begin
    ShowMessage(E.Message);
    WorkStoredProc.Transaction.Rollback;
    Exit;
   end;
 end;
    BESch.Text      :='';
    BEDeb.Text      :='';
    BEKred.Text     :='';
    BEMol.Text      :='';
    BEBut.Text      :='';
    BEStatRoz.Text  :='';
    BEKek.Text      :='';
    BENomn.Text     :='';

end;

procedure TFilterMainForm.CBSchPropertiesChange(Sender: TObject);
begin
  BESch.Enabled:=CBSch.Checked;
end;

procedure TFilterMainForm.BENomnPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
 hPack     : HModule;
 ShowSprav : function (AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE;_ID_SESSION:Int64;FMS :TFormStyle):Variant;stdcall;
 Res:Variant;
begin
 hPack := GetModuleHandle('NomnAnalize.bpl');
 if hPack < 32 then hPack := LoadPackage('NomnAnalize.bpl');
 if hPack > 0 then begin
  @ShowSprav := GetProcAddress(hPack, PCHAR('ShowFilter'));
  if @ShowSprav <> NIL then Res := ShowSprav(self, WorkDatabase.Handle,ID_SESSION,fsNormal);
 end else begin
  ShowMessage(PChar('Error!'));
  BENomn.Text:=VarToStr(Res);
 end;
 BENomn.Text:=VarToStr(Res);
end;

procedure TFilterMainForm.BESchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 hPack     : HModule;
 ShowSprav : function (AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aID_SESSION: int64; var aResult: boolean):Variant; stdcall;
 Res:Variant;
 RB:Boolean;
 TempStr:String;
 i:Integer;
begin
 hPack := GetModuleHandle('MatasSpr.bpl');
 if hPack < 32 then hPack := LoadPackage('MatasSpr.bpl');
 if hPack > 0 then begin
  @ShowSprav := GetProcAddress(hPack, PCHAR('GetMatSchMulti'));
  if @ShowSprav <> NIL then
   begin
    Res:= ShowSprav(self, WorkDatabase.Handle,0,ID_SESSION,RB);
     if VarArrayDimCount(Res)>0 then
     begin
       for i:=0 to VarArrayHighBound(Res,1)-1 do
        TempStr:=TempStr+' '+VarToStr(Res[i][1])+';';
       BESch.Text:=TempStr;
     end
   end;
 end else begin
  ShowMessage(PChar('Error!'));
 end;
end;

end.
