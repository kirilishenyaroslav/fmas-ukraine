unit uPrK_PROT_ZACH_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, RxMemDS, FIBDataSet, pFIBDataSet, dxBar,
  dxBarExtItems, ActnList, ImgList, cxGroupBox, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxContainer, cxLabel, cxCheckBox, Placemnt;

type
  TFormPrK_PROT_ZACH_Add = class(TForm)
    ImageListProtZachAdd: TImageList;
    ActionListEkzVedom: TActionList;
    ActionSaveProtokol: TAction;
    ActionOtmena: TAction;
    dxBarManagerEkzVedom: TdxBarManager;
    dxBarLargeButtonSave: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    DataSourceProtZachAdd: TDataSource;
    DataSetProtZachAdd: TpFIBDataSet;
    RxMemoryProtZachAdd: TRxMemoryData;
    cxGridPrKProtZachAdd: TcxGrid;
    cxGridPrKProtZachAddDBTableView1: TcxGridDBTableView;
    colNAME_FAK: TcxGridDBColumn;
    colNAME_SPEC: TcxGridDBColumn;
    colNAME_DERG_ZAKAZ: TcxGridDBColumn;
    colNAME_FORM_STUD: TcxGridDBColumn;
    colNAME_KAT_STUD: TcxGridDBColumn;
    colNAME_SROK_OB: TcxGridDBColumn;
    colIS_SELECT: TcxGridDBColumn;
    cxGridPrKProtZachAddLevel1: TcxGridLevel;
    cxGroupBox1: TcxGroupBox;
    cxLabelDate: TcxLabel;
    cxDateEditDate: TcxDateEdit;
    cxLabelNomer: TcxLabel;
    cxTextEditNomer: TcxTextEdit;
    FormStoragePrKPZ_Add: TFormStorage;
    procedure FormCreate(Sender: TObject);
    procedure ActionOtmenaExecute(Sender: TObject);
    procedure ActionSaveProtokolExecute(Sender: TObject);
    procedure cxTextEditNomerKeyPress(Sender: TObject; var Key: Char);
  private
    Id_Lang: integer;
    FSelectSQLTextPrZ_Add: string;
    procedure InicCaption;
    procedure SetSelectSQLTextPrZ_Add(const Value: string);
  public
    Id_OutPZ_Global :Int64;
    property SelectSQLTextPrZ_Add :string read FSelectSQLTextPrZ_Add write SetSelectSQLTextPrZ_Add;
  end;

var
  FormPrK_PROT_ZACH_Add: TFormPrK_PROT_ZACH_Add;

implementation
uses
  uPrK_Resources,uConstants,uPrK_PROT_ZACH;
{$R *.dfm}

procedure TFormPrK_PROT_ZACH_Add.FormCreate(Sender: TObject);
var
   i,j:Int64;
begin
    Id_Lang  :=SelectLanguage;
    InicCaption;

    i:=TFormPrK_PROT_ZACH(self.Owner).ID_GOD_NABORA_GLOBAL;
    if not TFormPrK_PROT_ZACH(self.Owner).DataSetFob_Prot.IsEmpty then
      j:=TFormPrK_PROT_ZACH(self.Owner).DataSetFob_Prot['ID_SP_FOB_PROT']
    else
      j:=-1;
    cxTextEditNomer.Text:='';
    cxDateEditDate.Date :=date;

    SelectSQLTextPrZ_Add :='Select * from PRK_DT_PROT_ZACH_FOR_ADD_SEL('+IntToStr(j)+','+IntToStr(i)+')';
end;

procedure TFormPrK_PROT_ZACH_Add.InicCaption;
var
   i: integer;
begin
   i:=Id_Lang;
    cxGridPrKProtZachAddDBTableView1.Styles.Header     :=TFormPrK_PROT_ZACH(Self.owner).cxStyleHeader;
    cxGridPrKProtZachAddDBTableView1.Styles.Background :=TFormPrK_PROT_ZACH(Self.owner).cxStyleBackGround_Content;
    cxGridPrKProtZachAddDBTableView1.Styles.Content    :=TFormPrK_PROT_ZACH(Self.owner).cxStyleBackGround_Content;
    cxGridPrKProtZachAddDBTableView1.Styles.Selection  :=TFormPrK_PROT_ZACH(Self.owner).cxStyleSelection;
    cxGridPrKProtZachAddDBTableView1.Styles.Inactive   :=TFormPrK_PROT_ZACH(Self.owner).cxStyleInactive;

    TFormPrK_PROT_ZACH_Add(self).Caption                :=nFormPrK_PROT_ZACH_Add_Caption[i];
    cxLabelNomer.Caption   :=nLabelNomer[i];
    cxLabelDate.Caption    :=nLabelDateForm[i];

    ActionSaveProtokol.Caption   :=nActionSave[i];
    ActionSaveProtokol.Hint      :=nHintActionSave[i];
    ActionOtmena.Caption         :=nAction_Exit[i];
    ActionOtmena.Hint            :=nHintAction_Exit[i];

    colNAME_FAK.Caption          :=ncolNAME_FAK[i];
    colNAME_SPEC.Caption         :=ncolNAME_SPEC[i];
    colNAME_FORM_STUD.Caption    :=ncolSHORT_NAME_CN_FORM_STUD[i];
    colNAME_DERG_ZAKAZ.Caption   :=ncolDERG_ZAKAZ[i];
    colNAME_KAT_STUD.Caption     :=ncolSHORT_NAME_CN_KAT_STUD[i];
    colNAME_SROK_OB.Caption      :=ncolNAME_SROK_OB[i];
    colIS_SELECT.Caption         :=ncolIS_SELECTED[i];
end;

procedure TFormPrK_PROT_ZACH_Add.SetSelectSQLTextPrZ_Add(
  const Value: string);
begin
  FSelectSQLTextPrZ_Add := Value;
    DataSetProtZachAdd.Active                         :=false;
    DataSetProtZachAdd.Database                       := TFormPrK_PROT_ZACH(self.Owner).DataBasePrk;
    DataSetProtZachAdd.Transaction                    := TFormPrK_PROT_ZACH(self.Owner).TransactionReadPrK;
    DataSetProtZachAdd.SelectSQL.Clear;
    DataSetProtZachAdd.SQLs.SelectSQL.Text            := FSelectSQLTextPrZ_Add;
    DataSetProtZachAdd.CloseOpen(false);
    DataSetProtZachAdd.FetchAll;

    RxMemoryProtZachAdd.LoadFromDataSet(DataSetProtZachAdd,DataSetProtZachAdd.RecordCount,lmCopy);
    DataSetProtZachAdd.Active :=false;
end;

procedure TFormPrK_PROT_ZACH_Add.ActionOtmenaExecute(Sender: TObject);
begin
    close;
end;

procedure TFormPrK_PROT_ZACH_Add.ActionSaveProtokolExecute(
  Sender: TObject);
var
 id_Out :int64;
begin
    if trim(cxDateEditDate.Text)='' then
   begin
     ShowMessage(nMsgEmptyDATE[Id_Lang]);
     cxDateEditDate.SetFocus;
     exit;
   end;

   if trim(cxTextEditNomer.Text)='' then
   begin
     ShowMessage(nMsgEmptyNomer[Id_Lang]);
     cxTextEditNomer.SetFocus;
     exit;
   end;

    id_Out:=-1;
    RxMemoryProtZachAdd.Edit;
    RxMemoryProtZachAdd.Post;
    RxMemoryProtZachAdd.First;
    TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.Transaction.StartTransaction;
    while not RxMemoryProtZachAdd.Eof do
    begin
     if RxMemoryProtZachAdd.FieldByName('IS_SELECTED').AsInteger=1 then
     begin
      TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.StoredProcName:='PRK_DT_PROT_ZACH_FORM';
      TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.Prepare;
      TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.ParamByName('ID_DT_PROT_ZACH').AsInt64         :=id_Out;
      TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.ParamByName('ID_SP_GOD_NABORA').AsInt64        :=TFormPrK_PROT_ZACH(self.Owner).ID_GOD_NABORA_GLOBAL;
      TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.ParamByName('ID_SP_FOB_PROT').AsInt64          :=TFormPrK_PROT_ZACH(self.Owner).DataSetFob_Prot.FieldValues['ID_SP_FOB_PROT'];
      TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.ParamByName('ID_SP_DEPARTMENT_FAK').AsInteger  :=RxMemoryProtZachAdd.FieldValues['ID_SP_DEPARTMENT_FAK'];
      TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.ParamByName('ID_SP_SPEC').AsInt64              :=RxMemoryProtZachAdd.FieldValues['ID_SP_SPEC'];
      TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.ParamByName('ID_CN_SP_FORM_STUD').AsInt64      :=RxMemoryProtZachAdd.FieldValues['ID_CN_SP_FORM_STUD'];
      TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.ParamByName('ID_SP_DERG_ZAKAZ').AsInt64        :=RxMemoryProtZachAdd.FieldValues['ID_SP_DERG_ZAKAZ'];
      TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.ParamByName('ID_CN_SP_KAT_STUD').AsInt64       :=RxMemoryProtZachAdd.FieldValues['ID_CN_SP_KAT_STUD'];
      TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.ParamByName('ID_SP_SROK_OB').AsInt64           :=RxMemoryProtZachAdd.FieldValues['ID_SP_SROK_OB'];
      TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.ParamByName('NOMER').AsInteger                 :=StrToInt(cxTextEditNomer.Text);
      TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.ParamByName('DATE_FORM').AsDate                :=cxDateEditDate.Date;
      TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.ParamByName('ID_USER').AsInt64                 :=TFormPrK_PROT_ZACH(self.Owner).ID_USER_GLOBAL;
      try
          TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.ExecProc;
          id_Out:=TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.FieldByName('ID_OUT').AsInt64;
      except on e: Exception do
         begin
            MessageBox(Handle,Pchar(nMsgErrorTransaction[Id_Lang]+chr(13)+
                       nMsgTryAgain[Id_Lang]+nMsgOr[Id_Lang]+nMsgToAdmin[Id_Lang]+chr(13)+
                       e.Message),Pchar(nMsgBoxTitle[Id_Lang]),MB_OK or MB_ICONWARNING);
            TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.Transaction.Rollback;
            Exit;
         end;
      end;
     end;
       RxMemoryProtZachAdd.Next;
    end;

   try
      TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.Transaction.Commit;
   except on e: Exception do
      begin
         MessageBox(Handle,Pchar(nMsgErrorTransaction[Id_Lang]+chr(13)+
                    nMsgTryAgain[Id_Lang]+nMsgOr[Id_Lang]+nMsgToAdmin[Id_Lang]+chr(13)+
                    e.Message),Pchar(nMsgBoxTitle[Id_Lang]),MB_OK or MB_ICONWARNING);
         TFormPrK_PROT_ZACH(self.Owner).StoredProcPrK.Transaction.Rollback;
         Exit;
      end;
   end;
   Id_OutPZ_Global:=id_Out;
   ShowMessage(nMsgSaveProtokolWasOk[Id_Lang]);

   ModalResult:=mrOk;
end;

procedure TFormPrK_PROT_ZACH_Add.cxTextEditNomerKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (Key = '.') or (Key=',') then Key := Chr(0);
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then     Key := Chr(0);
end;

end.



