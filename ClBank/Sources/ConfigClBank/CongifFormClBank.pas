unit CongifFormClBank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Halcn6db, StdCtrls, Buttons, Mask, ExtCtrls,
  FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc, IniFiles,
  RXCtrls, ToolEdit,IBase, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, RxMemDS, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxDropDownEdit, cxContainer, cxTextEdit,
  cxMaskEdit, cxCheckComboBox, cxGridBandedTableView,ComCtrls, FIBDataSet,
  pFIBDataSet, Grids, ValEdit, DBCtrls,ConstClBank, cxCheckBox, cxCalc,
  cxButtonEdit,LoadDogManedger,DogLoaderUnit;

type
  TfrmConfigExports = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    FEDBName: TFilenameEdit;
    pFIBDB: TpFIBDatabase;
    pFIBTr: TpFIBTransaction;
    pFIBSP: TpFIBStoredProc;
    BitBtnSave: TBitBtn;
    HDataSet: THalcyonDataSet;
    DataSource1: TDataSource;
    RxMemoryDataSP: TRxMemoryData;
    pFIBDataSetSP: TpFIBDataSet;
    StatusBar1: TStatusBar;
    ButtonGet: TButton;
    cxGrid: TcxGrid;
    cxGridDBTableView: TcxGridDBTableView;
    GridSPParam: TcxGridDBColumn;
    GridFieldDBF: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    DataSourceSP: TDataSource;
    RxLabelDBF: TLabel;
    PanelDBF: TPanel;
    DBLookupListBoxDBF: TDBLookupListBox;
    DataSourceDBF: TDataSource;
    RxMemoryDataDBF: TRxMemoryData;
    WriteTransaction: TpFIBTransaction;
    StyleRepository: TcxStyleRepository;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    pFIBDataSetLaunch: TpFIBDataSet;
    ButtonClose: TButton;
    cxCheckBoxCheckDate: TcxCheckBox;
    cxCheckBoxCheckDublicate: TcxCheckBox;
    cxTextEditName_Section: TcxTextEdit;
    RxLabelName_Section: TLabel;
    cxCheckBoxModiSum: TcxCheckBox;
    cxCheckBoxUSE_MFO: TcxCheckBox;
    cxCalcEditINSUM: TcxCalcEdit;
    cxCalcEditOUT_SUM: TcxCalcEdit;
    LabelInSum: TLabel;
    LabelOutSum: TLabel;
    cxButtonEditMFO: TcxButtonEdit;
    cxTextEditNAME_BANK: TcxTextEdit;
    Label1: TLabel;
    LabelNAME_BANK: TLabel;
    cxCheckBoxINOUT_SUM: TcxCheckBox;
    cxCheckBox_USE_A_B: TcxCheckBox;
    cxCheckBoxConstName: TcxCheckBox;
    cxCheckBoxUseKazn: TcxCheckBox;
    cxCheckBoxConvertString: TcxCheckBox;
    cxCheckBoxNotDelete: TcxCheckBox;
    cxCheckBoxChooseFile: TcxCheckBox;
    cxCheckBoxUSENative: TcxCheckBox;
    cxCheckBoxAutomat: TcxCheckBox;
    DirectoryEdit1: TDirectoryEdit;
    cxTextEdit1: TcxTextEdit;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    procedure BitBtnSaveClick(Sender: TObject);
    procedure ButtonGetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FEDBNameExit(Sender: TObject);
    procedure DBLookupListBoxDBFDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonCloseClick(Sender: TObject);
    procedure cxButtonEditMFOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckBoxUSE_MFOClick(Sender: TObject);
    procedure cxCheckBoxINOUT_SUMClick(Sender: TObject);
  private
  public

    pcount: integer;
    constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE;Bank:Variant;Name_Bank:String);overload;
  end;
var
  frmConfigExports:TfrmConfigExports;
  id_bank:Variant;
  id_mfo:Int64;
  mfo:String;
implementation

{$R *.dfm}
constructor TfrmConfigExports.Create(AOwner : TComponent;DB:TISC_DB_HANDLE;Bank:Variant;Name_Bank:String);
var
   i:Integer;
begin
  inherited Create(AOwner);
  pFIBDB.handle:=DB;

  LoadSysData(pFIBTr);

  Caption:=ConstClBank.ClBank_SETUP+' '+ Name_Bank;
  id_bank:=Bank;
// начальная заргузка данных
  pFIBDataSetLaunch.Active:=false;
  pFIBDataSetLaunch.ParamByName('param_bank').Value:=id_bank;
  pFIBDataSetLaunch.Active:=true;
  pFIBDataSetLaunch.FetchAll;
  if pFIBDataSetLaunch.FieldByName('CHECK_DATE').AsInteger=1 then
    begin
      cxCheckBoxCheckDate.Checked:=true;
    end;
  if pFIBDataSetLaunch.FieldByName('CHECK_DUBLICATE').AsInteger=1 then
    begin
      cxCheckBoxCheckDublicate.Checked:=true;
    end;
  if pFIBDataSetLaunch.RecordCount>0 then
   begin
     RxMemoryDataSP.EmptyTable;
     RxMemoryDataDBF.EmptyTable;
     pFIBDataSetLaunch.First;
     FEDBName.FileName:=pFIBDataSetLaunch.FieldByName('PATH_FILE').AsString;
     cxTextEditName_Section.Text:=pFIBDataSetLaunch.FieldByName('SECTION').AsString;
     cxTextEditNAME_BANK.Text:=pFIBDataSetLaunch.FieldByName('SHORT_NAME').AsString;
     DirectoryEdit1.Text:=pFIBDataSetLaunch.FieldByName('PATH_FOLDER').AsString;
     if (pFIBDataSetLaunch.FieldByName('USE_CONST_A_B').AsInteger=1) then
       begin
         cxCheckBox_USE_A_B.Checked:=true;
       end
       else
       begin
         cxCheckBox_USE_A_B.Checked:=false;
       end;

     if (pFIBDataSetLaunch.FieldByName('DATA_IN_SUM').AsInteger<>-100) or
        (pFIBDataSetLaunch.FieldByName('DATA_IN_SUM').AsInteger<>-100) then
        begin
          cxCalcEditINSUM.Value:=pFIBDataSetLaunch.FieldByName('DATA_IN_SUM').AsInteger;
          cxCalcEditOUT_SUM.Value:=pFIBDataSetLaunch.FieldByName('DATA_OUT_SUM').AsInteger;
          cxCheckBoxINOUT_SUM.Checked:=true;
        end
        else
        begin
          cxCheckBoxINOUT_SUM.Checked:=false;
        end;
     if (pFIBDataSetLaunch.FieldByName('USE_MFO_SETUP').AsInteger=1) then
       begin
         cxCheckBoxUSE_MFO.Checked:=true;
         cxButtonEditMFO.text:=pFIBDataSetLaunch.FieldByName('ID_SP_MFO').asstring;
         mfo:=pFIBDataSetLaunch.FieldByName('ID_SP_MFO').asstring;
       end
       else
       begin
         cxCheckBoxUSE_MFO.Checked:=false;
       end;
     if (pFIBDataSetLaunch.FieldByName('MODI_SUM').AsInteger=1) then
       begin
         cxCheckBoxModiSum.Checked:=true;
       end
       else
       begin
         cxCheckBoxModiSum.Checked:=false;
       end;
     if (pFIBDataSetLaunch.FieldByName('CONST_FILE_NAME').AsInteger=1) then
       begin
         cxCheckBoxConstName.Checked:=true;
       end
       else
       begin
         cxCheckBoxConstName.Checked:=false;
       end;

     if (pFIBDataSetLaunch.FieldByName('USE_NAME_KAZN').AsInteger=1) then
       begin
         cxCheckBoxUseKazn.Checked:=true;
       end
       else
       begin
         cxCheckBoxUseKazn.Checked:=false;
       end;
     if (pFIBDataSetLaunch.FieldByName('CONVERT_STRING').AsInteger=1) then
       begin
         cxCheckBoxConvertString.Checked:=true;
       end
       else
       begin
         cxCheckBoxConvertString.Checked:=false;
       end;
     if (pFIBDataSetLaunch.FieldByName('FILE_NOT_DELETE').AsInteger=1) then
       begin
         cxCheckBoxNotDelete.Checked:=true;
       end
       else
       begin
         cxCheckBoxNotDelete.Checked:=false;
       end;
     if (pFIBDataSetLaunch.FieldByName('CHOOSE_FILE').AsInteger=1) then
       begin
         cxCheckBoxChooseFile.Checked := true;
         FEDBName.Visible             := false;
         RxLabelDBF.Visible           := false;
         DirectoryEdit1.Visible       := true;
       end
       else
       begin
         cxCheckBoxChooseFile.Checked := false;
         FEDBName.Visible             := true;
         RxLabelDBF.Visible           := true;
         DirectoryEdit1.Visible       := false;
       end;

     if (pFIBDataSetLaunch.FieldByName('SPESIAL_ACC').AsInteger=1) then
       begin
         cxCheckBoxUSENative.Checked:=true;
       end
       else
       begin
         cxCheckBoxUSENative.Checked:=false;
       end;

     if (pFIBDataSetLaunch.FieldByName('USE_AUTOMAT').AsInteger=1) then
       begin
         cxCheckBoxAutomat.Checked:=true;
       end
       else
       begin
         cxCheckBoxAutomat.Checked:=false;
       end;

     for i:=0 to pFIBDataSetLaunch.RecordCount-1 do
       begin
         RxMemoryDataDBF.Open;
         RxMemoryDataDBF.Insert;
         RxMemoryDataDBF.FieldValues['RxMemoryDataDBFFieldDBF']:=pFIBDataSetLaunch.FieldByName('NAME_FILE_PARAMETRS').AsString;
         RxMemoryDataDBF.Post;
         RxMemoryDataSP.Open;
         RxMemoryDataSP.Insert;
         RxMemoryDataSP.FieldValues['RXSPParam']:=pFIBDataSetLaunch.FieldByName('NAME_SP_PARAMETRS').AsString;
         RxMemoryDataSP.FieldValues['RXFieldDBF']:=pFIBDataSetLaunch.FieldByName('NAME_FILE_PARAMETRS').AsString;
         RxMemoryDataSP.Post;
         pFIBDataSetLaunch.Next;
       end;
       RxMemoryDataDBF.Open;
       RxMemoryDataDBF.Insert;
       RxMemoryDataDBF.FieldValues['RxMemoryDataDBFFieldDBF']:=ConstClBank.ClBank_IgnorFields;
       RxMemoryDataDBF.Post;
   end;
end;

procedure TfrmConfigExports.BitBtnSaveClick(Sender: TObject);
var
  i:integer;
begin
pFIBSP.StoredProcName:='CLBANK_INI_PARAM_DELETE';
pFIBSP.Transaction:=WriteTransaction;
WriteTransaction.StartTransaction;
pFIBSP.Prepare;
pFIBSP.ParamByName('ID_BANK').Value:=id_bank;
try
pFIBSP.ExecProc;
WriteTransaction.Commit;
  Except
    begin
      WriteTransaction.Rollback;
      ShowMessage(ConstClBank.ClBank_MESSAGE_SAVE_ERROR);
    end;
end;

    pFIBSP.StoredProcName:='CLBANK_INI_UPDATE';
    pFIBSP.Transaction:=WriteTransaction;
    WriteTransaction.StartTransaction;
    pFIBSP.Prepare;
    pFIBSP.ParamByName('ID_BANK').AsInt64:=id_bank;
    pFIBSP.ParamByName('SHORT_NAME').AsString:=cxTextEditNAME_BANK.Text;
    pFIBSP.ParamByName('SECTION').AsString:=cxTextEditName_Section.Text;
    pFIBSP.ParamByName('NAME_SP').AsString:='CLBANK_TMP_BUFFER_INSERT';
    pFIBSP.ParamByName('PATH_FILE').AsString:=FEDBName.FileName;
    pFIBSP.ParamByName('PATH_FOLDER').AsString:=DirectoryEdit1.Text;
    if cxCheckBoxCheckDate.Checked=true then
    begin
        pFIBSP.ParamByName('CHECK_DATE').AsInteger:=1;
    end
    else
    begin
        pFIBSP.ParamByName('CHECK_DATE').AsInteger:=0;
    end;

    if cxCheckBoxCheckDublicate.Checked=true then
    begin
        pFIBSP.ParamByName('CHECK_DUBLICATE').AsInteger:=1;
    end
    else
    begin
        pFIBSP.ParamByName('CHECK_DUBLICATE').AsInteger:=0;
    end;
    if cxCheckBoxModiSum.Checked=true then
    begin
        pFIBSP.ParamByName('MODI_SUM').AsInteger:=1;
    end
    else
    begin
        pFIBSP.ParamByName('MODI_SUM').AsInteger:=0;
    end;
    if cxCheckBoxUSE_MFO.Checked=true then
    begin
        pFIBSP.ParamByName('USE_MFO_SETUP').AsInteger:=1;
        pFIBSP.ParamByName('ID_SP_MFO').AsInt64:=StrToInt64(mfo);
    end
    else
    begin
        pFIBSP.ParamByName('USE_MFO_SETUP').AsInteger:=0;
        pFIBSP.ParamByName('ID_SP_MFO').AsInt64:=0;
    end;
    if cxCheckBoxINOUT_SUM.Checked=true then
    begin
        pFIBSP.ParamByName('DATA_IN_SUM').Value:=cxCalcEditINSUM.Value;
        pFIBSP.ParamByName('DATA_OUT_SUM').Value:=cxCalcEditOUT_SUM.Value;
    end
    else
    begin
        pFIBSP.ParamByName('DATA_IN_SUM').AsInteger:=-100;
        pFIBSP.ParamByName('DATA_OUT_SUM').AsInt64:=-100;
    end;
    if cxCheckBox_USE_A_B.Checked=true then
    begin
        pFIBSP.ParamByName('USE_CONST_A_B').AsInteger:=1;
    end
    else
    begin
        pFIBSP.ParamByName('USE_CONST_A_B').AsInteger:=0;
    end;
    if cxCheckBoxConstName.Checked=true then
    begin
        pFIBSP.ParamByName('CONST_FILE_NAME').AsInteger:=1;
    end
    else
    begin
        pFIBSP.ParamByName('CONST_FILE_NAME').AsInteger:=0;
    end;

    if cxCheckBoxUseKazn.Checked=true then
    begin
        pFIBSP.ParamByName('USE_NAME_KAZN').AsInteger:=1;
    end
    else
    begin
        pFIBSP.ParamByName('USE_NAME_KAZN').AsInteger:=0;
    end;

    if cxCheckBoxConvertString.Checked=true then
    begin
        pFIBSP.ParamByName('CONVERT_STRING').AsInteger:=1;
    end
    else
    begin
        pFIBSP.ParamByName('CONVERT_STRING').AsInteger:=0;
    end;

    if cxCheckBoxNotDelete.Checked=true then
    begin
        pFIBSP.ParamByName('FILE_NOT_DELETE').AsInteger:=1;
    end
    else
    begin
        pFIBSP.ParamByName('FILE_NOT_DELETE').AsInteger:=0;
    end;

    if cxCheckBoxChooseFile.Checked=true then
    begin
        pFIBSP.ParamByName('CHOOSE_FILE').AsInteger:=1;
        FEDBName.Visible             := false;
        RxLabelDBF.Visible           := false;
        DirectoryEdit1.Visible       := true;
    end
    else
    begin
        pFIBSP.ParamByName('CHOOSE_FILE').AsInteger:=0;
        FEDBName.Visible             := true;
        RxLabelDBF.Visible           := true;
        DirectoryEdit1.Visible        := false;
    end;

    if cxCheckBoxUSENative.Checked=true then
    begin
        pFIBSP.ParamByName('SPESIAL_ACC').AsInteger:=1;
    end
    else
    begin
        pFIBSP.ParamByName('SPESIAL_ACC').AsInteger:=0;
    end;

    if cxCheckBoxAutomat.Checked=true then
    begin
        pFIBSP.ParamByName('USE_AUTOMAT').AsInteger:=1;
    end
    else
    begin
        pFIBSP.ParamByName('USE_AUTOMAT').AsInteger:=0;
    end;

    try
    pFIBSP.ExecProc;
    WriteTransaction.Commit;
    Except
    begin
        WriteTransaction.Rollback;
        ShowMessage(ConstClBank.ClBank_MESSAGE_SAVE_ERROR);
        end;
end;


RxMemoryDataSP.First;
for i:=0 to RxMemoryDataSP.RecordCount-1 do
  begin
    if RxMemoryDataSP.FieldValues['RXFieldDBF']<>' ' then
      begin
         pFIBSP.StoredProcName:='CLBANK_INI_PARAM_INSERT';
         pFIBSP.Transaction:=WriteTransaction;
         WriteTransaction.StartTransaction;
         pFIBSP.Prepare;
         pFIBSP.ParamByName('ID_BANK').Value:=id_bank;
         pFIBSP.ParamByName('NAME_SP_PARAMETRS').Value:=RxMemoryDataSP.FieldValues['RXSPParam'];
         pFIBSP.ParamByName('NAME_FILE_PARAMETRS').Value:=RxMemoryDataSP.FieldValues['RXFieldDBF'];
         try
           pFIBSP.ExecProc;
           WriteTransaction.Commit;
           Except
             begin
               WriteTransaction.Rollback;
               ShowMessage(ConstClBank.ClBank_MESSAGE_SAVE_ERROR);
             end;
         end;
         RxMemoryDataSP.Next;
      end
      else
      begin
        RxMemoryDataSP.Next;
      end;
   end;
end;

procedure TfrmConfigExports.ButtonGetClick(sender:TObject);
var i,j:integer;
    ListDBF:TFieldDefList;
begin
{if SPName.KeyValue=Null then
  begin
    ShowMessage(ConstClBank.ClBank_MESSAGE_NO_SP);
    Exit;
  end;
  }
if FEDBName.FileName='' then
  begin
    ShowMessage(ConstClBank.ClBank_MESSAGE_NO_FILE);
    Exit;
  end;
if FileExists(FEDBName.FileName)=false then
  begin
    ShowMessage(ConstClBank.ClBank_MESSAGE_NI_FILE_EXIST);
    Exit;
  end;
     RxMemoryDataSP.EmptyTable;
     HDataSet.Active:=False;
     HDataSet.TableName:=FEDBName.FileName;
     try
       HDataSet.Active:=True;
       if pFIBDB.Connected<>True then
         begin
           pFIBDB.Connected:=True;
           pFIBTr.Active:=true;
         end;
       pFIBSP.StoredProcName:='CLBANK_TMP_BUFFER_INSERT';
       pFIBSP.Prepare;
       pFIBSP.ParamCount;
     except
       Exit;
     end;
     pcount:=pFIBSP.ParamCount;
     ListDBF:=TFieldDefList.Create(nil);
     ListDBF:=HDataSet.FieldDefList;
     RxMemoryDataDBF.EmptyTable;
     for i:=0 to HDataSet.FieldCount-1 do
       begin
         RxMemoryDataDBF.Open;
         RxMemoryDataDBF.Insert;
         RxMemoryDataDBF.FieldByName('RxMemoryDataDBFFieldDBF').Value:=ListDBF.Strings[i];
         RxMemoryDataDBF.Post;
       end;
     RxMemoryDataDBF.Open;
     RxMemoryDataDBF.Insert;
     RxMemoryDataDBF.FieldValues['RxMemoryDataDBFFieldDBF']:=ConstClBank.ClBank_IgnorFields;
     RxMemoryDataDBF.Post;
     for i:=0 to pcount-1 do
     begin
       if (pFIBSP.Params[i].Name<>'IN_DATE_CHECK')and (pFIBSP.Params[i].Name<>'IN_ID_BANK')then
         begin
           RxMemoryDataSP.Edit;
           RxMemoryDataSP.Insert;
           RxMemoryDataSP.FieldValues['RXSPPAram']:=pFIBSP.Params[i].Name;
           RxMemoryDataSP.FieldValues['RXFieldDBF']:=' ';
           RxMemoryDataSP.Post;
         end;
     end;
//проводим анализ и стараемся максимально возможно
//вывести соостветствие ХП и файла
   RxMemoryDataSP.First;
   for i:=0 to RxMemoryDataSP.RecordCount-1 do
     begin
       RxMemoryDataDBF.First;
       for j:=0 to RxMemoryDataDBF.RecordCount-1 do
         begin
           if RxMemoryDataSP.FieldValues['RXSPPAram']=RxMemoryDataDBF.FieldValues['RxMemoryDataDBFFieldDBF'] then
             begin
               RxMemoryDataSP.Open;
               RxMemoryDataSP.Edit;
               RxMemoryDataSP.FieldValues['RXFieldDBF']:=RxMemoryDataDBF.FieldValues['RxMemoryDataDBFFieldDBF'];
               RxMemoryDataSP.Post;
             end;
             RxMemoryDataDBF.Next;
         end;
       RxMemoryDataSP.Next;
     end;
   GridFieldDBF.SortOrder:=soAscending;
   BitBtnSave.Enabled:=True;
end;

procedure TfrmConfigExports.FormCreate(Sender: TObject);
begin
//загрзка интерфеса
  GridSPParam.Caption:=ConstClBank.ClBank_SPParam;
  GridFieldDBF.Caption:=ConstClBank.ClBank_CFieldDBF;
  RxLabelDBF.Caption:=ConstClBank.ClBank_FILE;
  ButtonGet.Caption:=ConstClBank.ClBank_GET_PARAM;
  ButtonClose.Caption:=ConstClBank.ClBank_ACTION_CLOSE_CONST;
  BitBtnSave.Caption:=ConstClBank.ClBank_ACTION_SAVE_CONST;
  cxCheckBoxCheckDublicate.Properties.Caption:=ConstClBank.ClBank_Check_Doublicate;
  cxCheckBoxCheckDate.Properties.Caption:=ConstClBank.ClBank_Check_Date;
  cxCheckBoxUSE_MFO.Properties.Caption:=ConstClBank.ClBank_USE_MFO;
  cxCheckBoxINOUT_SUM.Properties.Caption:=ConstClBank.ClBank_INOUT_SUM;
  RxLabelName_Section.Caption:=ConstClBank.ClBank_CODE_BANK;
  LabelNAME_BANK.Caption:=ConstClBank.ClBank_NAME_BANK;
  LabelInSum.Caption:=ConstClBank.ClBank_prihod;
  LabelOutSum.Caption:=ConstClBank.ClBank_rashod;
  cxCheckBoxModiSum.Properties.Caption:=ConstClBank.ClBank_MODI_SUM;

  pFIBDataSetSP.Active:=false;
  pFIBDataSetSP.Active:=true;
  pFIBDataSetSP.FetchAll;

end;

procedure TfrmConfigExports.FEDBNameExit(Sender: TObject);
begin
  if (FEDBName.FileName<>'') then
    begin
//      FEDBName.FileName:=ExtractFilePath(FEDBName.FileName);
     if FileExists(FEDBName.FileName) then
       begin
         HDataSet.Active:=False;
         HDataSet.TableName:=FEDBName.FileName;
         try
           HDataSet.Active:=True;
         except
           begin
//////////////////////////////////////////
           Exit;
           end;
         end;
         HDataSet.Active:=False;
       end;
    end;
end;

procedure TfrmConfigExports.DBLookupListBoxDBFDblClick(Sender: TObject);
begin
  RxMemoryDataSP.Open;
  RxMemoryDataSP.Edit;
  RxMemoryDataSP.FieldValues['RXFieldDBF']:=RxMemoryDataDBF.FieldbyName('RxMemoryDataDBFFieldDBF').Value;
  RxMemoryDataSP.Post;
end;

procedure TfrmConfigExports.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmConfigExports.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConfigExports.cxButtonEditMFOPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  i, o : TSpravParams;
begin
    i := TSpravParams.Create;
    o := TSpravParams.Create;
    i['DataBase']     := Integer(pFIBDB.Handle);
    i['FormStyle']    := fsNormal;
    i['bMultiSelect'] := false;
    i['id_session']   := -1;
    i['SelectMode']   := selRateAccount;
    i['show_all']     := 1;
    i['actual_date']   := Date;

    LoadSprav('Customer\CustPackage.bpl', Self, i, o);
    if o['ModalResult'] = mrOk then
      begin
        id_mfo := o['ID_BANK'];
        mfo := o['MFO'];
        cxButtonEditMFO.Text := VarToStr(o['MFO']);
      end;
    i.Free;
    o.Free;
end;

procedure TfrmConfigExports.cxCheckBoxUSE_MFOClick(Sender: TObject);
begin
if cxCheckBoxUSE_MFO.Checked=true then
  begin
     cxButtonEditMFO.Style.Color:=$00E7FFFF;
  end
  else
  begin
     cxButtonEditMFO.Style.Color:=cl3DLight;
  end
end;

procedure TfrmConfigExports.cxCheckBoxINOUT_SUMClick(Sender: TObject);
begin
if cxCheckBoxINOUT_SUM.Checked=true then
  begin
    cxCalcEditINSUM.Enabled:=true;
    cxCalcEditOUT_SUM.Enabled:=true;
  end
  else
  begin
    cxCalcEditINSUM.Enabled:=false;
    cxCalcEditOUT_SUM.Enabled:=false;
  end
end;

end.
