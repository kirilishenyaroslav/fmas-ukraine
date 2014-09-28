unit BsLgotClient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, cxTextEdit, FIBDataSet, pFIBDataSet,
  dxBar, dxBarExtItems, ActnList, ImgList, uConsts, uCommon_Funcs, uCommon_Types,
  iBase, BsClient, uCommon_Messages, cxTL, cxInplaceContainer, cxTLData,
  cxDBTL, cxMaskEdit, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  pFIBStoredProc, cxCurrencyEdit;

type
  TfrmLgotClient = class(TForm)
    LgotBarManager: TdxBarManager;
    LgotDS: TDataSource;
    LgotDSet: TpFIBDataSet;
    btnAdd: TdxBarLargeButton;
    btnDel: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    LgotActList: TActionList;
    ImageList: TImageList;
    ActIns: TAction;
    ActDel: TAction;
    ActClose: TAction;
    btnLgotSwitch: TdxBarLargeButton;
    LgotStoredProc: TpFIBStoredProc;
    LgotWriteTrans: TpFIBTransaction;
    btnEdit: TdxBarLargeButton;
    ActEdit: TAction;
    LgotList: TcxDBTreeList;
    ColumnIdPersonPrivKey: TcxDBTreeListColumn;
    ColumnIdParentPriv: TcxDBTreeListColumn;
    ColumnFio: TcxDBTreeListColumn;
    ColumnProcent: TcxDBTreeListColumn;
    ColumnNameLgot: TcxDBTreeListColumn;
    ColumnDateBeg: TcxDBTreeListColumn;
    StyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
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
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    ColumnIdPersonPriv: TcxDBTreeListColumn;
    ColumnDateEnd: TcxDBTreeListColumn;
    AddMenu: TdxBarPopupMenu;
    btnAddLgotParent: TdxBarLargeButton;
    btnAddLgotChild: TdxBarLargeButton;
    DelMenu: TdxBarPopupMenu;
    btnLgotCLose: TdxBarLargeButton;
    btnLgotDel: TdxBarLargeButton;
    btnRefrsh: TdxBarLargeButton;
    ActRefresh: TAction;
    procedure ActCloseExecute(Sender: TObject);
    procedure btnLgotSwitchClick(Sender: TObject);
    procedure LgotDSetEndScroll(DataSet: TDataSet);
    procedure ActEditExecute(Sender: TObject);
    procedure btnAddLgotParentClick(Sender: TObject);
    procedure btnAddLgotChildClick(Sender: TObject);
    procedure btnLgotCLoseClick(Sender: TObject);
    procedure btnLgotDelClick(Sender: TObject);
    procedure LgotListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActRefreshExecute(Sender: TObject);
  private
    { Private declarations }
    MainDbHadle:TISC_DB_HANDLE;
    KodMachine:Integer;
    procedure LgotDSetCloseOpen;
    procedure PersonPrivelegesAdd(isParent:SmallInt);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; DbHandle:TISC_DB_HANDLE;
                       KodMachineIn:Integer);reintroduce;
  end;

var
  frmLgotClient: TfrmLgotClient;

implementation

{$R *.dfm}

uses BsLgotClientEdit, BsLgotPeriods, BsDateEnd;

constructor TfrmLgotClient.Create(AOwner:TComponent; DbHandle:TISC_DB_HANDLE;
                                  KodMachineIn:Integer);
var HtKey:TbsShortCut;
    iLang:Byte;
begin
   inherited Create(AOwner);
   HtKey:=LoadShortCut(DbHandle, AOwner);
   MainDbHadle:=DbHandle;
   iLang:=uCommon_Funcs.bsLanguageIndex();
   ActIns.ShortCut:=HtKey.Add;
   ActIns.Caption:=uConsts.bs_InsertBtn_Caption[iLang];
   ActDel.ShortCut:=HtKey.Del;
   ActDel.Caption:=uConsts.bs_DeleteBtn_Caption[iLang];
   ActClose.ShortCut:=HtKey.Close;
   ActClose.Caption:=uConsts.bs_ExitBtn_Caption[iLang];
   ActEdit.ShortCut:=HtKey.Edit;
   ActEdit.Caption:=uConsts.bs_EditBtn_Caption[iLang];
   KodMachine:=KodMachineIn;
   if KodMachineIn<>-1 then LgotDSetCloseOpen;
   btnLgotSwitch.LargeImageIndex:=4;
end;

procedure TfrmLgotClient.LgotDSetCloseOpen;
begin
   try
     if LgotDSet.Active then LgotDSet.Close;
     LgotDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_PERSON_PRIVILEGES_SEL(:KOD_MACHINE, :ACT_DATE)';
     LgotDSet.ParamByName('KOD_MACHINE').AsInteger:=KodMachine;
     LgotDSet.ParamByName('ACT_DATE').AsDate:=Date;
     LgotDSet.Open;
   except on E:Exception
          do begin
                bsShowMessage('Увага!', E.Message, mtInformation, [mbOK]);
          end;
   end;
end;

procedure TfrmLgotClient.ActCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfrmLgotClient.btnLgotSwitchClick(Sender: TObject);
var frm:TfrmLgotPeriod;
    RetId:Integer;
    StrMsg:string;
begin
    if LgotDset.isEmpty then Exit;
    frm:=TfrmLgotPeriod.Create(Self, MainDbHadle);
    frm.DateBeg.Date:=LgotDSet['DATE_BEG'];
    frm.DateEnd.Date:=LgotDSet['DATE_END'];
    if frm.ShowModal=mrOk then
    begin
       LgotStoredProc.StoredProcName:='BS_PERSON_PRIV_SWITCH';
       LgotStoredProc.Transaction.StartTransaction;
       LgotStoredProc.Prepare;
       LgotStoredProc.ParamByName('ID_PERSON_PRIV').AsInteger:=LgotDSet['ID_PERSON_PRIV'];
       LgotStoredProc.ParamByName('NUM_PRIV').AsShort:=btnLgotSwitch.LargeImageIndex-4;
       LgotStoredProc.ParamByName('DATE_BEG').AsDate:=frm.DateBeg.Date;
       LgotStoredProc.ParamByName('DATE_END').AsDate:=frm.DateEnd.Date;
       LgotStoredProc.ParamByName('IS_FULL_PERIOD').AsShort:=Smallint(Boolean(frm.FullPeriod.Checked));
       try
         LgotStoredProc.ExecProc;
         RetId:=LgotStoredProc.FieldByName('RET_VALUE').AsInteger;
         StrMsg:=LgotStoredProc.FieldByName('ER_MSG').AsString;
         if StrMsg='No' then LgotStoredProc.Transaction.Commit
         else
         begin
            LgotStoredProc.Transaction.Rollback;
            bsShowMessage('Увага!', StrMsg, mtInformation, [mbOK]);
         end;
         LgotDSetCloseOpen;
         LgotDSet.Locate('ID_PERSON_PRIV_KEY', RetId, []);
       except on E:Exception
              do begin
                    bsShowMessage('Увага!', E.Message, mtInformation, [mbOK]);
                    LgotStoredProc.Transaction.Rollback;
              end;
       end;
    end;
    frm.Free;

    if StrMsg='No' then
    begin
       if btnLgotSwitch.Caption='TurnOff' then
       begin
          btnLgotSwitch.Caption:='TurnOn';
          btnLgotSwitch.Hint:='Увімкнути дію пільги';
          btnLgotSwitch.LargeImageIndex:=5;
       end
       else
       begin
          btnLgotSwitch.Caption:='TurnOff';
          btnLgotSwitch.Hint:='Вимкнути дію пільги';
          btnLgotSwitch.LargeImageIndex:=4;
       end;
    end;
end;

procedure TfrmLgotClient.PersonPrivelegesAdd(isParent:SmallInt);
var frm:TfrmLgotEdit;
    Id:Integer;
begin
   if isParent=1 then Id:=-1
   else Id:=LgotDSet['ID_PERSON_PRIV'];
   frm:=TfrmLgotEdit.Create(Self, KodMachine, Id, 0);
   if frm.ShowModal=mrOk then
   begin
      LgotStoredProc.Transaction.StartTransaction;
      LgotStoredProc.StoredProcName:='BS_PERSON_PRIVILEGES_INS';
      LgotStoredProc.Prepare;
      if isParent=1 then LgotStoredProc.ParamByName('ID_PARENT_PERSON_PRIV').Value:=Null
      else LgotStoredProc.ParamByName('ID_PARENT_PERSON_PRIV').AsInteger:=LgotDSet['ID_PARENT_PERSON_PRIV'];
      LgotStoredProc.ParamByName('KOD_MACHINE').AsInteger:=KodMachine;
      LgotStoredProc.ParamByName('SURNAME_PERSON_PRIV').AsString:=frm.FirstNameBox.EditText;
      LgotStoredProc.ParamByName('FIRSTNAME_PERSON_PRIV').AsString:=frm.NameBox.EditText;
      LgotStoredProc.ParamByName('SECONDNAME_PERSON_PRIV').AsString:=frm.PatrBox.EditText;
      LgotStoredProc.ParamByName('TIN_PERSON_PRIV').AsString:=frm.InnEdit.Text;
      LgotStoredProc.ParamByName('ID_PERSON_PRIV_TYPE').AsShort:=frm.GroupBox.EditValue;
      LgotStoredProc.ParamByName('NUM_PRIV').AsShort:=1;
      LgotStoredProc.ParamByName('DATE_BEG').AsDate:=frm.DateBeg.Date;
      LgotStoredProc.ParamByName('DATE_END').AsDate:=frm.DateEnd.Date;
      LgotStoredProc.ParamByName('ID_LGOT').AsInteger:=frm.LgotBox.EditValue;
      LgotStoredProc.ParamByName('NUM_DOC').AsString:=frm.NomerEdit.Text;
      LgotStoredProc.ParamByName('NUM_ORGANIZATION').AsString:=frm.CustServiceEdit.Text;
      LgotStoredProc.ParamByName('IS_PARENT').AsShort:=isParent;
      LgotStoredProc.ParamByName('TYPE_CHANGE').AsShort:=0;
      try
        LgotStoredProc.ExecProc;
        Id:=LgotStoredProc.FieldByName('ID_PERSON_KEY').AsInteger;
        LgotStoredProc.Transaction.Commit;
        LgotDSetCloseOpen;
        LgotDSet.Locate('ID_PERSON_PRIV_KEY', Id, []);
      except on E:Exception
             do begin
                  bsShowMessage('Увага!', E.Message, mtInformation, [mbOK]);
                  LgotStoredProc.Transaction.Rollback;
             end;
      end;
   end;
   frm.Free;
end;

procedure TfrmLgotClient.LgotDSetEndScroll(DataSet: TDataSet);
begin
   if LgotDSet.IsEmpty then Exit;
   if not VarIsNull(LgotDSet['NUM_PRIV']) then
   begin
      btnLgotSwitch.LargeImageIndex:=5-LgotDSet['NUM_PRIV'];
   end;
end;

procedure TfrmLgotClient.ActEditExecute(Sender: TObject);
var frm:TfrmLgotEdit;
    Id:Integer;
begin
   if LgotDSet.IsEmpty then Exit;
   Id:=LgotDSet['ID_PARENT_PERSON_PRIV'];
   frm:=TfrmLgotEdit.Create(Self, KodMachine, Id, 1);
   if frm.ShowModal=mrOk then
   begin
      LgotStoredProc.StoredProcName:='BS_PERSON_PRIV_DOC_UPD';
      LgotStoredProc.Transaction.StartTransaction;
      LgotStoredProc.Prepare;
      LgotStoredProc.ParamByName('ID_PERSON_PRIV').AsInteger:=Id;
      LgotStoredProc.ParamByName('ID_PRIVILEGES').AsInteger:=frm.LgotBox.EditValue;
      LgotStoredProc.ParamByName('NUM_DOC').AsString:=frm.NomerEdit.Text;
      LgotStoredProc.ParamByName('NUM_ORGANIZATION').AsString:=frm.CustServiceEdit.Text;
      LgotStoredProc.ParamByName('DATE_BEG').AsDate:=frm.DateBeg.Date;
      LgotStoredProc.ParamByName('DATE_END').AsDate:=frm.DateEnd.Date;
      try
        LgotStoredProc.ExecProc;
        LgotStoredProc.Transaction.Commit;
        LgotDSetCloseOpen;
        LgotDSet.Locate('ID_PERSON_PRIV', Id, [])
      except on E:Exception
             do begin
                  bsShowMessage('Увага!', E.Message, mtInformation, [mbOK]);
                  LgotStoredProc.Transaction.Rollback;
             end;
      end;
   end;
   frm.Free;
end;

procedure TfrmLgotClient.btnAddLgotParentClick(Sender: TObject);
begin
   PersonPrivelegesAdd(1);
end;

procedure TfrmLgotClient.btnAddLgotChildClick(Sender: TObject);
begin
   if LgotDSet.IsEmpty then
   begin
      BsShowMessage('Увага!', 'Не можливо додати підлеглу пільгу, доки не додана основна!', mtInformation, [mbOk]);
      Exit;
   end;
   PersonPrivelegesAdd(0);
end;

procedure TfrmLgotClient.btnLgotCLoseClick(Sender: TObject);
var frm:TfrmDateClose;
    StrMsg:string;
begin
   if LgotDSet.IsEmpty then Exit;
   if bsShowMessage('Увага!', 'Ви дійсно бажаєте закрити обрану пільгу?', mtConfirmation, [mbYes, mbNo])=mrNo then Exit;
   frm:=TfrmDateClose.Create(Self);
   if frm.ShowModal=mrOk then
   begin
      LgotStoredProc.StoredProcName:='BS_PERSON_PRIVILEGES_CLOSE';
      LgotStoredProc.Transaction.StartTransaction;
      LgotStoredProc.Prepare;
      LgotStoredProc.ParamByName('ID_PARENT_PRIV').AsInteger:=LgotDSet['ID_PARENT_PERSON_PRIV'];
      LgotStoredProc.ParamByName('DATE_CLOSE').AsDate:=frm.DateEnd.Date;
      try
        LgotStoredProc.ExecProc;
        StrMsg:=LgotStoredProc.FieldByName('ER_MSG').AsString;
        if StrMsg='No' then LgotStoredProc.Transaction.Commit
        else
        begin
           LgotStoredProc.Transaction.Rollback;
           bsShowMessage('Увага!', StrMsg, mtInformation, [mbOK]);
        end;
        LgotDSetCloseOpen;
      except on E:Exception
             do begin
                   LgotStoredProc.Transaction.Rollback;
                   bsShowMessage('Увага!', E.Message, mtInformation, [mbOK]);
             end;
      end;
   end;
   frm.Free;
end;

procedure TfrmLgotClient.btnLgotDelClick(Sender: TObject);
var StrMsg:string;
begin
   if LgotDSet.IsEmpty then Exit;
   if bsShowMessage('Увага!', 'Ви дійсно бажаєте видалити цей запис?', mtConfirmation, [mbYes, mbNo])=mrNo then Exit;
   LgotStoredProc.StoredProcName:='BS_PERSON_PRIVILEGES_DEL';
   LgotStoredProc.Transaction.StartTransaction;
   LgotStoredProc.Prepare;
   LgotStoredProc.ParamByName('ID_PERSON_PRIV').AsInteger:=LgotDSet['ID_PERSON_PRIV'];
   LgotStoredProc.ParamByName('ID_PARENT_PRIV').AsInteger:=LgotDSet['ID_PARENT_PERSON_PRIV'];
   try
     LgotStoredProc.ExecProc;
     StrMsg:=LgotStoredProc.FieldByName('ER_MSG').AsString;
     if StrMsg='No' then LgotStoredProc.Transaction.Commit
     else
     begin
        bsShowMessage('Увага!', StrMsg, mtInformation, [mbOK]);
        LgotStoredProc.Transaction.Rollback;
     end;
     LgotDSetCloseOpen;
   except on E:Exception
          do begin
                bsShowMessage('Увага!', E.Message, mtInformation, [mbOK]);
                LgotStoredProc.Transaction.Rollback;
          end;
   end;
end;

procedure TfrmLgotClient.LgotListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var frm:TfrmLgotEdit;
begin
   if LgotDSet.IsEmpty then Exit;
   case key of
      VK_RETURN: begin
                    frm:=TfrmLgotEdit.Create(Self, KodMachine, LgotDSet['ID_PERSON_PRIV'], 2);
                    frm.ShowModal;
                    frm.Free;
                 end;
      VK_SPACE:  begin
                    if LgotList.FocusedNode.HasChildren
                    then LgotList.FocusedNode.Expanded:=not LgotList.FocusedNode.Expanded;
                 end;
   end;
end;

procedure TfrmLgotClient.ActRefreshExecute(Sender: TObject);
begin
   LgotDSetCloseOpen;
end;

end.
