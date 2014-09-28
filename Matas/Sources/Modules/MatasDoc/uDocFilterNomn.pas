unit uDocFilterNomn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, frxClass, frxDBSet,
  FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc, DB,
  FIBDataSet, pFIBDataSet, cxSpinEdit, cxCheckBox, cxButtonEdit,
  cxControls, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  StdCtrls, cxButtons, ibase, uMatasUtils, uMatasVars, uSpTipDocMulti, uPackageManager,
  uSpMatOtv;

type
  TFilterNomnForm = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxDatebeg: TcxDateEdit;
    cxDateEnd: TcxDateEdit;
    cxTIPD: TcxButtonEdit;
    ckbox: TcxCheckBox;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    cxCopies: TcxSpinEdit;
    WorkDatabase: TpFIBDatabase;
    WorkDataSet: TpFIBDataSet;
    WorkStoredProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    lbl5: TLabel;
    BEGrTMC: TcxButtonEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    cxText: TcxTextEdit;
    cxCheckBox1: TcxCheckBox;
    cxCheck: TcxCheckBox;
    cxMVO: TcxButtonEdit;
    lbl8: TLabel;
    cxCheckMOL: TcxCheckBox;
    cxTextEdit1: TcxTextEdit;
    procedure cxTIPDPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckPropertiesChange(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxMVOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckMOLPropertiesChange(Sender: TObject);
  private
    DBHANDLE : TISC_DB_HANDLE;
  public
    FILTER_ID_SESSION, ID_SESSION, F_ID_MO: Integer;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; dbeg:TDate; dend:TDate);overload;
  end;

var
  FilterNomnForm: TFilterNomnForm;

implementation

{$R *.dfm}
constructor TFilterNomnForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; dbeg:TDate; dend:TDate);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
  Self.DBHANDLE := DBHandle;
  Self.WorkDatabase.Close;
  Self.WorkDatabase.Handle:=DBHANDLE;
 end;
 FILTER_ID_SESSION:=WorkDatabase.Gen_Id('MAT_ID_SESSION', 1);
 ID_SESSION:=WorkDatabase.Gen_Id('MAT_ID_SESSION', 1);
 cxDatebeg.EditValue:= dbeg;
 cxDateEnd.EditValue:=dend;
 ckbox.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
 cxCheck.Checked:=False;
 lbl6.Enabled:=False;
 lbl7.Enabled:=False;
 cxText.Enabled:=False;
 F_ID_MO:=0;
 lbl8.Enabled:=False;
 cxMVO.Enabled:=False;
end;

procedure TFilterNomnForm.cxTIPDPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  FormResult: Boolean;
  VarDimCnt: integer;
  i: integer;
  s: string;
begin
  Res:=uSpTipDocMulti.GetTipDocMulti(self, self.DBHANDLE, 0, FILTER_ID_SESSION, FormResult);
  if FormResult then begin
  if  VarType(Res) <> varEmpty then begin
   VarDimCnt:=VarArrayHighBound(Res,  1);
   s:='';
   for i:=0 to VarDimCnt do begin
    s:=s+VarToStr(Res[i][1])+';';
   end;
   cxTIPD.Text := s;
  end
 end

end;

procedure TFilterNomnForm.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  BEGrTMC.Text:=VarToStr(uPackageManager.GetGruppTMC(Self,DBHANDLE, 0, ID_SESSION, 5, _MATAS_PERIOD, 'ãðóïïè ÒÌÖ',1));
end;

procedure TFilterNomnForm.cxCheckPropertiesChange(Sender: TObject);
begin
    if cxCheck.Checked = False then
    begin
    lbl6.Enabled:=False;
    lbl7.Enabled:=False;
    cxText.Enabled:=False;
    end
    else
    begin
    lbl6.Enabled:=True;
    lbl7.Enabled:=True;
    cxText.Enabled:=True;
    end;
end;

procedure TFilterNomnForm.cxButton2Click(Sender: TObject);
begin
Close;
end;

procedure TFilterNomnForm.cxButton1Click(Sender: TObject);
begin
 WorkDataSet.Close;
 WorkDataSet.SelectSql.Clear;
 WorkDataSet.SelectSql.Add('SELECT * From MAT_FILTER_DOC_NOMN(:filter_doc, :filter_nomn, :name, :date_beg, :date_end, :is_all_prov, :poisk, :id_mo)');
 WorkDataSet.SelectSql.Add(' order by tipd, date_doc');
 WorkDataSet.Prepare;
 WorkDataSet.ParamByName('filter_doc').asinteger:=FILTER_ID_SESSION;
 WorkDataSet.ParamByName('filter_nomn').asinteger:=ID_SESSION;
 WorkDataSet.ParamByName('name').asstring:=AnsiUpperCase(cxText.Text);
 WorkDataSet.ParamByName('date_beg').AsDate:=cxDatebeg.EditValue;
 WorkDataSet.ParamByName('date_end').AsDate:=cxDateend.EditValue;
 if cxCheckBox1.Checked = True then
 WorkDataSet.ParamByName('is_all_prov').AsInteger:=1
 else
 WorkDataSet.ParamByName('is_all_prov').AsInteger:=0;
 if cxCheck.Checked = True then
 WorkDataSet.ParamByName('poisk').AsInteger:=0
 else
 WorkDataSet.ParamByName('poisk').AsInteger:=1;
 if cxCheckMOL.Checked = True then
 WorkDataSet.ParamByName('id_mo').AsInteger:=F_ID_MO
 else  WorkDataSet.ParamByName('id_mo').AsInteger:=0;
 WorkDataSet.CloseOpen(False);

 frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\PrintFilteredDoc.fr3');

 frxReport1.Variables['DateB']:= ''''+DateToStr(cxDatebeg.EditValue)+'''';
 frxReport1.Variables['DateE']:= ''''+DateToStr(cxDateend.EditValue)+'''';
 frxReport1.Variables['ORG_NAME']:=''''+_ORG_FULL_NAME+'''';
 frxReport1.Variables['filter_doc']:=''''+cxTIPD.Text+'''';
 if cxCheck.Checked = True then
  frxReport1.Variables['filter_nomn']:=''''+cxText.Text+''''
  else
  frxReport1.Variables['filter_nomn']:=''''+BEGrTMC.Text+'''';
  if cxCheckMOL.Checked = True then
  frxReport1.Variables['filter_mvo']:=''''+cxMVO.Text+''''
  else frxReport1.Variables['filter_mvo']:=''''+cxTextEdit1.Text+'''';

 if cxCopies.Value>1 then
  frxReport1.PrintOptions.Copies:=cxCopies.Value;
  frxReport1.PrintOptions.ShowDialog:=cxSelectPrinter.Checked;
 if cxCheckOnPrinter.Checked then frxReport1.Print
 else frxReport1.ShowReport;
 if ckbox.Checked then frxReport1.DesignReport;
end;

procedure TFilterNomnForm.cxMVOPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
  Res : Variant;
begin
 Res:=uSpMatOtv.GetMatOtv(self, self.DBHANDLE, 0, F_ID_MO);
  if  VarType(Res) <> varEmpty
   then begin
{
  ResultArray[0] := Self.MatOtvDataSet['ID_MO'];
  ResultArray[1] := Self.MatOtvDataSet['FIO'];
  ResultArray[2] := Self.MatOtvDataSet['NAME_DEPARTMENT'];
  ResultArray[3] := Self.MatOtvDataSet['COMMENT'];
  ResultArray[4] := Self.MatOtvDataSet['SFIO'];
}
    F_ID_MO:=Res[0];
    cxMVO.Text := Res[1]+' / '+Res[2];

  end;
end;

procedure TFilterNomnForm.cxCheckMOLPropertiesChange(Sender: TObject);
begin
cxMVO.enabled:= cxCheckMOL.Checked;
lbl8.enabled:= cxCheckMOL.Checked;
end;

end.
