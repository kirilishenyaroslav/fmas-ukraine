unit uAddExistPRIK_ZACH;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet, pFIBDataSet, dxBar,
  dxBarExtItems, ActnList, ImgList, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid;

type
  TFormAddExistPRIK_ZACH = class(TForm)
    cxGridAddPr: TcxGrid;
    cxGridAddPrDBTableView1: TcxGridDBTableView;
    colNOMER: TcxGridDBColumn;
    colDATE_PRIKAZ: TcxGridDBColumn;
    colDATE_ZARAX: TcxGridDBColumn;
    cxGridAddPrLevel1: TcxGridLevel;
    ImageListAddPr: TImageList;
    ActionListAddPr: TActionList;
    ActionObnov: TAction;
    ActionVibrat: TAction;
    ActionOtmena: TAction;
    dxBarManagerAddpr: TdxBarManager;
    dxBarLargeButtonVibrat: TdxBarLargeButton;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    DataSetAddPr: TpFIBDataSet;
    DataSourceAddPr: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure ActionOtmenaExecute(Sender: TObject);
    procedure ActionVibratExecute(Sender: TObject);
  private
    Id_Lang :Integer;
    FSelectSQLTextPz_for_Add: string;
    procedure SetSelectSQLTextPz_for_Add(const Value: string);
    procedure InicCaption;
  public
    Return_Id_Out :Int64;
    Property SelectSQLTextPz_for_Add   :string read FSelectSQLTextPz_for_Add write SetSelectSQLTextPz_for_Add;
  end;

var
  FormAddExistPRIK_ZACH: TFormAddExistPRIK_ZACH;

implementation
uses
   uConstants,uPrK_PROT_ZACH, FIBQuery;
{$R *.dfm}

{ TFormAddExistPRIK_ZACH }

procedure TFormAddExistPRIK_ZACH.FormCreate(Sender: TObject);
begin
   InicCaption;
   SelectSQLTextPz_for_Add:= 'Select * from PRK_DT_PRIK_ZACH_FOR_INS_SEL(:ID_DT_PROT_ZACH,:ID_SP_GOD_NABORA)';
end;

procedure TFormAddExistPRIK_ZACH.SetSelectSQLTextPz_for_Add(
  const Value: string);
begin
  FSelectSQLTextPz_for_Add := Value;
    DataSetAddPr.Active                      :=false;
    DataSetAddPr.Database                    :=TFormPrK_PROT_ZACH(self.Owner).DataBasePrk;
    DataSetAddPr.Transaction                 :=TFormPrK_PROT_ZACH(self.Owner).TransactionReadPrK;
    DataSetAddPr.SelectSQL.Clear;
    DataSetAddPr.SQLs.SelectSQL.Text         :=FSelectSQLTextPz_for_Add;
    DataSetAddPr.ParamByName('ID_DT_PROT_ZACH').AsInt64     :=TFormPrK_PROT_ZACH(self.Owner).DataSetPrKPZ.FieldValues['ID_DT_PROT_ZACH'];
    DataSetAddPr.ParamByName('ID_SP_GOD_NABORA').AsInt64    :=TFormPrK_PROT_ZACH(self.Owner).ID_GOD_NABORA_GLOBAL;
    DataSetAddPr.CloseOpen(true);
end;

procedure TFormAddExistPRIK_ZACH.InicCaption;
var
 i: integer;
begin
   i:=TFormPrK_PROT_ZACH(self.Owner).IndLang;
   Id_Lang:=i;
   TFormAddExistPRIK_ZACH(self).Caption :=nFormAddExistPRIK_ZACH_Caption[i];

   ActionVibrat.Caption                 :=nAction_Vibrat[i];
   ActionObnov.Caption                  :=nActiont_Obnov[i];
   ActionOtmena.Caption                 :=nAction_Exit[i];

   ActionVibrat.Hint                    :=nHintAction_Vibrat[i];
   ActionObnov.Hint                     :=nHintAction_Obnov[i];
   ActionOtmena.Hint                    :=nHintAction_Exit[i];

   colNOMER.Caption                     :=ncolNOMER[i];
   colDATE_PRIKAZ.Caption               :=ncolDATE_PRIKAZ[i];
   colDATE_ZARAX.Caption                :=ncolDATE_ZARAX[i];

   cxGridAddPrDBTableView1.Styles.Header     :=TFormPrK_PROT_ZACH(Self.Owner).cxStyleHeader;
   cxGridAddPrDBTableView1.Styles.Background :=TFormPrK_PROT_ZACH(Self.Owner).cxStyleBackGround_Content;
   cxGridAddPrDBTableView1.Styles.Content    :=TFormPrK_PROT_ZACH(Self.Owner).cxStyleBackGround_Content;
   cxGridAddPrDBTableView1.Styles.Selection  :=TFormPrK_PROT_ZACH(Self.Owner).cxStyleSelection;
   cxGridAddPrDBTableView1.Styles.Inactive   :=TFormPrK_PROT_ZACH(Self.Owner).cxStyleInactive;
end;

procedure TFormAddExistPRIK_ZACH.ActionObnovExecute(Sender: TObject);
var
  id_locate :int64;
begin
  if DataSetAddPr.FieldValues['ID_DT_PRIK_ZACH']<>Null
   then id_locate :=DataSetAddPr.FieldValues['ID_DT_PRIK_ZACH']
   else id_locate :=-1;
  DataSetAddPr.CloseOpen(false);
  DataSetAddPr.Locate('ID_DT_PRIK_ZACH',id_locate,[]);
end;

procedure TFormAddExistPRIK_ZACH.ActionOtmenaExecute(Sender: TObject);
begin
    close;
end;

procedure TFormAddExistPRIK_ZACH.ActionVibratExecute(Sender: TObject);
begin
  if DataSetAddPr.FieldValues['ID_DT_PRIK_ZACH']<>Null then
  begin
    TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.Transaction.StartTransaction;
    TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.StoredProcName:='PRK_DT_PRIK_ZACH_FORM';
    TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.Prepare;
    TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.ParamByName('ID_DT_PRIK_ZACH').AsInt64   :=DataSetAddPr.FieldValues['ID_DT_PRIK_ZACH'];
    TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.ParamByName('ID_DT_PROT_ZACH').AsInt64   :=TFormPrK_PROT_ZACH(self.Owner).DataSetPrKPZ.FieldValues['ID_DT_PROT_ZACH'];
    TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.ParamByName('NOMER').AsString            :=DataSetAddPr.FieldValues['NOMER'];
    TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.ParamByName('DATE_PRIKAZ').AsDate        :=DataSetAddPr.FieldValues['DATE_PRIKAZ'];
    TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.ParamByName('DATE_ZARAX').AsDate         :=DataSetAddPr.FieldValues['DATE_ZARAX'];
    TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.ParamByName('IS_CEL_NABOR').AsInteger    :=DataSetAddPr.FieldValues['IS_CEL_NABOR'];
    TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.ParamByName('ID_USER').AsInt64           :=TFormPrK_PROT_ZACH(self.Owner).ID_USER_GLOBAL;
     try
        TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.ExecProc;
        TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.Transaction.commit;
        Return_Id_Out:=TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.FldByName['ID_OUT'].AsInt64
     except on e: Exception do
        begin
           MessageBox(Handle,Pchar(nMsgErrorTransaction[Id_Lang]+chr(13)+
                      nMsgTryAgain[Id_Lang]+nMsgOr[Id_Lang]+nMsgToAdmin[Id_Lang]+chr(13)+
                      e.Message),Pchar(nMsgBoxTitle[Id_Lang]),MB_OK or MB_ICONWARNING);
           TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.Transaction.Rollback;
           Exit;
        end;
     end;
    ModalResult :=MrOk;
  End;
end;

end.
