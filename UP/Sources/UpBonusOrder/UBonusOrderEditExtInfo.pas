unit UBonusOrderEditExtInfo;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uFControl, uLabeledFControl, uSpravControl, StdCtrls, Buttons,
    GlobalSPR, qFTools, uCommonSP, uCharControl, uFloatControl, DB,
    FIBDataSet, pFIBDataSet, cxLookAndFeelPainters, cxButtons, uIntControl,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, BaseTypes;

type
    TfrmGetExtInfo = class(TForm)
        Label3: TLabel;
        Department: TqFSpravControl;
        PostSalary: TqFSpravControl;
        Label4: TLabel;
        qFSC_SovmestFIO: TqFSpravControl;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        SovmKoeff: TqFFloatControl;
        TypePost: TqFSpravControl;
        PostSalaryShtat: TqFSpravControl;
    ShrId: TqFIntControl;
    btnSHRSearch: TcxButton;
    SHRSet: TpFIBDataSet;
    StorProc: TpFIBStoredProc;
    ShrTransaction: TpFIBTransaction;
    btnClearinfo: TcxButton;
        procedure OkButtonClick(Sender: TObject);
        procedure TypePostOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure qFSC_SovmestFIOOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure DepartmentOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure PostSalaryOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
    procedure PostSalaryShtatOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure btnSHRSearchClick(Sender: TObject);
    procedure btnClearinfoClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    private
        KeySes:Integer;
    { Private declarations }
    public
    { Public declarations }
        ACT_DATE, DateBeg: TDate;
        constructor Create(AOwner:TComponent; KeySession:Integer; DateB:TDate);
        procedure ExecProcShr(IsDelete:String);
    end;

implementation

uses UpBonusOrderForm, uShtatUtils, uUnivSprav, RxMemDS, uSelectForm;

{$R *.dfm}

constructor TfrmGetExtInfo.Create(AOwner:TComponent; KeySession:Integer; DateB:TDate);
begin
   inherited Create(AOwner);
   KeySes:=KeySession;
   DateBeg:=DateB;
end;

procedure TfrmGetExtInfo.ExecProcShr(IsDelete:String);
begin
   StorProc.StoredProcName:='UP_ACCEPT_SHR_INS2';
   StorProc.Transaction.StartTransaction;
   StorProc.ParamByName('KEY_SESSION').AsInteger:=KeySes;
   StorProc.ParamByName('ID_SH_R').Value:=ShrId.Value;
   StorProc.ParamByName('RATE_COUNT').AsFloat:=0;
   StorProc.ParamByName('ONLY_DELETE').AsString:=IsDelete;
   StorProc.ExecProc;
   StorProc.Transaction.Commit;
end;

procedure TfrmGetExtInfo.OkButtonClick(Sender: TObject);
begin
    if VarIsNull(PostSalaryShtat.Value) then
    begin
        PostSalaryShtat.Value := PostSalary.Value;
        PostSalaryShtat.DisplayText := PostSalary.DisplayText;
    end;
    if VarIsNull(TypePost.Value) then
    begin
        agShowMessage('Треба вибрати тип персоналу для суміщення!');
        Exit;
    end;
    ModalResult := mrOk;
    ExecProcShr('T');
end;

procedure TfrmGetExtInfo.TypePostOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Довідник типів персонала';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'UP_ACCEPT_GET_TYPE_POST(' + VarToStr(PostSalaryShtat.Value) + ',' + VarToStr(Department.Value) + ',' + QuotedStr(DateToStr(ACT_DATE)) + ')';
    Params.Fields := 'NAME_TYPE_POST,ID_TYPE_POST';
    Params.FieldsName := 'Назва';
    Params.KeyField := 'ID_TYPE_POST';
    Params.ReturnFields := 'NAME_TYPE_POST,ID_TYPE_POST';
    Params.DBHandle := Integer(TfmBonusOrder(self.Owner).WorkDatabase.Handle);
    OutPut := TRxMemoryData.Create(self);
    if GetUnivSprav(Params, OutPut)
        then begin
        Value := output['ID_TYPE_POST'];
        DisplayText := VarToStr(output['NAME_TYPE_POST']);
    end;
end;

procedure TfrmGetExtInfo.qFSC_SovmestFIOOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
    sp := GetSprav('asup\PCardsList');
    if sp <> nil then
    begin
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(TfmBonusOrder(self.Owner).WorkDatabase.Handle);
            FieldValues['ActualDate'] := Date;
            FieldValues['AdminMode'] := 0;
            FieldValues['Select'] := 1;
            FieldValues['ShowStyle'] := 0;
            Post;
        end;
        sp.Show;

        if (sp.Output <> nil) and not sp.Output.IsEmpty
            then begin
            Value := sp.Output['ID_PCARD'];
            DisplayText := sp.Output['FIO'];
        end;
    end;
end;

procedure TfrmGetExtInfo.DepartmentOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(TfmBonusOrder(self.Owner).WorkDatabase.Handle);
            FieldValues['Select'] := 1;
            FieldValues['ShowStyle'] := 0;
            Post;
        end;
        sp.Show;

        if (sp.Output <> nil) and not sp.Output.IsEmpty
            then begin
            Value := sp.Output['ID_DEPARTMENT'];
            DisplayText := sp.Output['NAME_FULL'];
            PostSalary.Blocked := false;
            PostSalaryShtat.Blocked := false;
        end;
    end;
end;

procedure TfrmGetExtInfo.PostSalaryOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Довідник типів персонала';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    //Params.TableName := 'UP_ACCEPT_GET_POST_EX(' + VarToStr(Department.Value) + ',' + QuotedStr(DateToStr(ACT_DATE)) + ')';
    Params.TableName := 'UP_ACCEPT_GET_POST_REAL_2(' + QuotedStr(PostSalaryShtat.Value) +','+QuotedStr(DateToStr(ACT_DATE)) + ')';
    Params.Fields := 'POST_NAME,SALARY_MIN,SALARY_MAX,ID_POST_SALARY';
    //Params.Fields := 'POST_NAME,NUM_DIGIT,NAME_TYPE_POST,SALARY_MIN,SALARY_MAX,ID_POST_SALARY';
    Params.FieldsName := 'Назва,мін,макс';
    Params.KeyField := 'ID_POST_SALARY';
    Params.ReturnFields := 'POST_NAME,ID_POST_SALARY';
    Params.DBHandle := Integer(TfmBonusOrder(self.Owner).WorkDatabase.Handle);
    OutPut := TRxMemoryData.Create(self);
    if GetUnivSprav(Params, OutPut)
        then begin
        value := output['ID_POST_SALARY'];
        DisplayText := VarToStr(output['POST_NAME']);
        //PostSalaryShtat.Value := output['ID_POST_SALARY'];
        //PostSalaryShtat.DisplayText := VarToStr(output['POST_NAME']);
        TypePost.Blocked := false;
        TypePost.Value := null;
        TypePost.DisplayText := '';
    end;
end;

procedure TfrmGetExtInfo.PostSalaryShtatOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Довідник типів персонала';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'UP_ACCEPT_GET_POST_EX(' + VarToStr(Department.Value) + ',' + QuotedStr(DateToStr(ACT_DATE)) + ')';
    //Params.TableName := 'UP_ACCEPT_GET_POST_REAL_2(' + QuotedStr(PostSalaryShtat.Value) +','+QuotedStr(DateToStr(ACT_DATE)) + ')';
    Params.Fields := 'POST_NAME,NUM_DIGIT,NAME_TYPE_POST,SALARY_MIN,SALARY_MAX,ID_POST_SALARY';
    Params.FieldsName := 'Назва,розряд,тип,мін,макс';
    Params.KeyField := 'ID_POST_SALARY';
    Params.ReturnFields := 'POST_NAME,ID_POST_SALARY';
    Params.DBHandle := Integer(TfmBonusOrder(self.Owner).WorkDatabase.Handle);
    OutPut := TRxMemoryData.Create(self);
    if GetUnivSprav(Params, OutPut)
        then begin
        value := output['ID_POST_SALARY'];
        DisplayText := VarToStr(output['POST_NAME']);
        //PostSalaryShtat.Value := output['ID_POST_SALARY'];
       // PostSalaryShtat.DisplayText := VarToStr(output['POST_NAME']);
        TypePost.Blocked := false;
        TypePost.Value := null;
        TypePost.DisplayText := '';
    end;
end;

procedure TfrmGetExtInfo.btnSHRSearchClick(Sender: TObject);
begin
   ExecProcShr('F');

   SHRSet.Close;
   SHRSet.SQLs.SelectSQL.Text:='select distinct * from UP_DT_ID_SH_R_SELECT(:DATE_BEG, null, :KEY_SESSION, null)';
   SHRSet.ParamByName('DATE_BEG').AsDate:=DateBeg;
   SHRSet.ParamByName('KEY_SESSION').AsInteger:=KeySes;
   SHRSet.Open;
   if not SHRSet.IsEmpty then
   begin
      PostSalary.Blocked:=False;
      PostSalaryShtat.Blocked:=False;
      TypePost.Blocked:=False;
      Department.Value:=SHRSet['Id_Department'];
      Department.DisplayText:=SHRSet['Department_Name'];
      PostSalaryShtat.Value:=SHRSet['Id_Post_Salary'];
      PostSalaryShtat.DisplayText:=SHRSet['Name_Post'];
      PostSalary.Value:=SHRSet['Id_Post_Salary'];
      PostSalary.DisplayText:=SHRSet['Name_Post'];
      SovmKoeff.Value:=SHRSet['Koeff_Pps'];
      TypePost.Value:=SHRSet['Id_Type_Post'];
      TypePost.DisplayText:=SHRSet['Name_Type_Post'];
   end;
end;

procedure TfrmGetExtInfo.btnClearinfoClick(Sender: TObject);
begin
   PostSalary.Blocked:=True;
   PostSalaryShtat.Blocked:=True;
   TypePost.Blocked:=True;
   Department.Value:=null;
   Department.DisplayText:='';
   PostSalaryShtat.Value:=null;
   PostSalaryShtat.DisplayText:='';
   PostSalary.Value:=null;
   PostSalary.DisplayText:='';
   SovmKoeff.Value:=0;
   TypePost.Value:=null;
   TypePost.DisplayText:='';
   ExecProcShr('T');
end;

procedure TfrmGetExtInfo.CancelButtonClick(Sender: TObject);
begin
  try
   ExecProcShr('T');
   ModalResult:=mrCancel;
  except on e:Exception
  do ShowMessage(e.Message);
  end; 
end;

end.

