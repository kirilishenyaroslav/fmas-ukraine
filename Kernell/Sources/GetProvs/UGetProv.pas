unit UGetProv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ExtCtrls, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ToolWin, ComCtrls, cxLabel, cxContainer,
  cxTextEdit, cxDBEdit, StdCtrls, cxGridBandedTableView,
  cxGridDBBandedTableView, FIBDatabase, pFIBDatabase, Ibase, FIBDataSet,
  pFIBDataSet, ImgList,UGetDoc, ActnList,fib,pFibStoredProc,UDocFilter,
  Menus, cxCheckBox, cxMemo,  AccMGMT, Placemnt, cxButtonEdit;

type
  TfrmSprProvs = class(TForm)
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    WorkDatabase: TpFIBDatabase;
    DocsDataSet: TpFIBDataSet;
    SmallImages: TImageList;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    DelButton: TToolButton;
    UpdateButton: TToolButton;
    RefreshButton: TToolButton;
    ToolButton14: TToolButton;
    CloseButton: TToolButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    DocsView: TcxGridDBBandedTableView;
    DocsViewDBBandedColumn1: TcxGridDBBandedColumn;
    DocsViewDBBandedColumn2: TcxGridDBBandedColumn;
    DocsViewDBBandedColumn3: TcxGridDBBandedColumn;
    DocsViewDBBandedColumn4: TcxGridDBBandedColumn;
    DocsViewDBBandedColumn5: TcxGridDBBandedColumn;
    ToolButton1: TToolButton;
    ActionList1: TActionList;
    Action1: TAction;
    DocsDataSource: TDataSource;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    DocsViewDBBandedColumn6: TcxGridDBBandedColumn;
    PopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Panel1: TPanel;
    CheckGroupPanel: TcxCheckBox;
    DocsViewDBBandedColumn7: TcxGridDBBandedColumn;
    DocsViewDBBandedColumn8: TcxGridDBBandedColumn;
    cxCheckBox1: TcxCheckBox;
    Panel2: TPanel;
    Splitter1: TSplitter;
    cxDBMemo1: TcxDBMemo;
    DocsViewDBBandedColumn9: TcxGridDBBandedColumn;
    DocsViewDBBandedColumn10: TcxGridDBBandedColumn;
    DocsViewDBBandedColumn11: TcxGridDBBandedColumn;
    Panel3: TPanel;
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    Label2: TLabel;
    Label3: TLabel;
    DocsViewDBBandedColumn12: TcxGridDBBandedColumn;
    AddPopupMenu: TPopupMenu;
    N9: TMenuItem;
    N10: TMenuItem;
    Label4: TLabel;
    cxDBMemo2: TcxDBMemo;
    FormStorage1: TFormStorage;
    PopupMenu1: TPopupMenu;
    N11: TMenuItem;
    N12: TMenuItem;
    PopupMenu2: TPopupMenu;
    N13: TMenuItem;
    N14: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure DocsViewDblClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure CheckGroupPanelClick(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
  private
    login : string;
    user  : string;
    id_user:int64;
    { Private declarations }
  public
    WorkPeriod:TdateTime;
    work_id_form_kod:Integer;
    WorkPeriod_str:string;
    ResultValue:Variant;
    frmDocFilter: TfrmDocFilter;
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE; ActualDate:TDateTime; DB_CR_FLAG:Integer;Id_user:Integer;login,user:string;id_form_uch:integer);overload;
    function GetMainSql:String;
    { Public declarations }
  end;

  function GetProvs(AOwner:TComponent;DBHandle:TISC_DB_HANDLE; ActualDate:TDateTime; DB_CR_FLAG:Integer;Id_user:Integer;login,user:string;id_form_uch:integer):Variant;stdcall;
  exports  GetProvs,GetDoc;

implementation

uses GlobalSpr, Kernel, BaseTypes, UGetPeriodM, cxCalendar;
{$R *.dfm}
{ TfrmSprProvs }

function GetProvs(AOwner:TComponent;DBHandle:TISC_DB_HANDLE; ActualDate:TDateTime; DB_CR_FLAG:Integer;Id_user:Integer;login,user:string;id_form_uch:integer):Variant;
var i:Integer;
    f:Boolean;
begin
    f:=true;
    for i:=0 to Application.MainForm.MDIChildCount-1 do
    begin
         if (Application.MainForm.MDIChildren[i] is TfrmSprProvs)
         then begin
                           Application.MainForm.MDIChildren[i].BringToFront;
                           f:=false;
         end;
    end;
    if f then GetProvs:=integer(TfrmSprProvs.Create(AOwner,DBHandle,ActualDate,DB_CR_FLAG,Id_user,login,user,id_form_uch));
end;


constructor TfrmSprProvs.Create(AOwner: TComponent;DBHandle:TISC_DB_HANDLE; ActualDate: TDateTime;DB_CR_FLAG:Integer;Id_user:Integer;login,user:string;id_form_uch:integer);
var I:Integer;
begin
     inherited Create(AOwner);
     self.WorkPeriod      :=ActualDate;
     self.work_id_form_kod:=id_form_uch;

     if (self.work_id_form_kod=9)
     then begin
               cxStyle13.Color:=clSkyBlue;
               cxDBMemo1.Style.Color:=clSkyBlue;
               cxDBTextEdit1.Style.Color:=clSkyBlue;
               cxDBTextEdit2.Style.Color:=clSkyBlue;
               cxDBMemo2.Style.Color:=clSkyBlue;
               
               for i:=0 to StyleRepository.Count-1 do
               begin
                     TcxStyle(StyleRepository.Items[i]).Font.Size:=8;
               end;
     end;

     self.id_user         :=id_user;
     WorkDatabase.Handle  :=DBHandle;

     frmDocFilter         :=TfrmDocFilter.Create(self);
     frmDocFilter.ActualDate:=ActualDate;

     if frmDocFilter.ShowModal=mrYes
     then begin
               WorkPeriod:=frmDocFilter.ActualDate;
               DocsDataSet.SelectSQL.Text:=GetMainSql;
               DocsDataSet.Open;
     end
     else PostMessage(Self.Handle,WM_CLOSE,0,0);
end;

procedure TfrmSprProvs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if Assigned(frmDocFilter) then FreeAndNil(frmDocFilter);
     Action:=caFree;
end;

procedure TfrmSprProvs.RefreshButtonClick(Sender: TObject);
var PK_ID:Int64;
begin
    PK_ID:=0;
    if DocsDataSet.RecordCount>0 then PK_ID:=StrToInt64(DocsDataSet.FieldByName('PK_ID').AsString);
    DocsDataSet.Close;
    DocsDataSet.Open;
    DocsDataSet.Locate('PK_ID',PK_ID,[]);
end;

procedure TfrmSprProvs.UpdateButtonClick(Sender: TObject);
var tempPk_ID,PK_ID:Int64;
begin
      if (DocsDataSet.RecordCount>0)
      then begin
            PK_ID:=StrToInt64(DocsDataSet.FieldByName('PK_ID').AsString);
            tempPk_ID:=GlobalSpr.GetDoc(Application.MainForm,WorkDatabase.Handle,PK_ID,id_user,false,login,user,work_id_form_kod,WorkPeriod);
            DocsView.BeginUpdate;
            DocsDataSet.Close;
            DocsDataSet.Open;
            DocsDataSet.Locate('PK_ID',IntToStr(tempPK_ID),[]);
            DocsView.EndUpdate;
      end;
end;

procedure TfrmSprProvs.DocsViewDblClick(Sender: TObject);
var PK_ID:Int64;
begin
      if DocsDataSet.RecordCount>0
         then begin
            PK_ID:=StrToInt64(DocsDataSet.FieldByName('PK_ID').AsString);
            PK_ID:=GlobalSpr.GetDoc(Application.MainForm,WorkDatabase.Handle,PK_ID,id_user,false,login,user,work_id_form_kod,WorkPeriod);
            DocsView.BeginUpdate;
            DocsDataSet.Close;
            DocsDataSet.Open;
            DocsDataSet.Locate('PK_ID',IntToStr(PK_ID),[]);
            DocsView.EndUpdate;
         end;
end;


procedure TfrmSprProvs.DelButtonClick(Sender: TObject);
var
   STRU:KERNEL_MODE_STRUCTURE;
   DoResult:Boolean;
   MSG_STRING:String;
   ErrorList:TStringList;
   i:INteger;
begin
     if fibCheckPermission('/ROOT/Kernell/MBook','Del')=0
     then begin //yes
                    if (DocsDataSet.RecordCount>0)
                    then begin
                         if BaseTypes.agMessageDlg('Уавга?','Ви хочете видалити документ?',mtWarning,[mbYes,mbNo])=mrYes
                         then begin
                             WriteTransaction.StartTransaction;
                             STRU.KEY_SESSION  :=WorkDatabase.Gen_Id('KERNEL_GEN_ID_SESSION',1);
                             STRU.DBHANDLE     :=WorkDatabase.Handle;
                             STRU.TRHANDLE     :=WriteTransaction.Handle;
                             STRU.WORKDATE     :=WorkPeriod;
                             STRU.KERNEL_ACTION:=2;
                             STRU.PK_ID        :=TFibBCDField(DocsDataSet.FieldByName('PK_ID')).AsInt64;
                             DoResult          :=Kernel.KernelDo(@STRU);
                             if DoResult
                             then begin
                                       DocsDataSet.CacheDelete;
                             end
                             else begin
                                       ErrorList:=Kernel.GetDocErrorsListEx(@STRU);
                                       MSG_STRING:='При видаленні документа були виявленні помилки. '+Chr(10)+chr(13);
                                       if ErrorList<>nil
                                       then begin
                                              for i:=0 to  ErrorList.Count-1 do
                                              begin
                                                    MSG_STRING:=MSG_STRING+' ПОМИЛКА- '+ErrorList.Strings[i];
                                              end;
                                       end;
                                       ShowMessage(MSG_STRING);
                             end;
                             WriteTransaction.Commit;
                        end;
                    end;
     end
     else begin
                agMessageDlg('Увага!','Ви маєте не маєте права для видалення документів.',mtInformation,[mbOk]);
     end;
end;

procedure TfrmSprProvs.ToolButton1Click(Sender: TObject);
var PK_ID:Int64;
begin
     if Assigned(frmDocFilter)
     then begin
          if frmDocFilter.ShowModal=mrYes
          then begin
                    if DocsDataSet.RecordCount>0
                    then PK_ID:= StrToInt64(DocsDataSet.FieldByName('PK_ID').AsString)
                    else PK_ID:= 0;

                    Screen.Cursor:=crSQLWait;

                    DocsDataSet.Close;
                    DocsDataSet.SelectSQL.Text:=GetMainSql;
                    DocsDataSet.Open;

                    self.WorkPeriod      :=frmDocFilter.ActualDate;

                    Screen.Cursor:=crDefault;                    

                    DocsDataSet.Locate('PK_ID',PK_ID,[]);
          end;
     end;
end;

function TfrmSprProvs.GetMainSql: String;
var ResStr:String;
    DateRegStr:String;
begin
    DateTimeToString(DateRegStr,'dd.mm.yyyy',frmDocFilter.ActualDate);

    if frmDocFilter.CheckSch.Checked
    then ResStr:=' SELECT * FROM MBOOK_DT_ALL_DOC_SELECT('+IntToStr(frmDocFilter.id_filter_sch)+',-1,'+''''+DateRegStr+''''+','+inttostr(work_id_form_kod)+')'
    else ResStr:=' SELECT * FROM MBOOK_DT_ALL_DOC_SELECT(NULL,NULL,'+''''+DateRegStr+''''+','+inttostr(work_id_form_kod)+')';

    if Assigned(frmDocFilter)
    then begin
            if frmDocFilter.CheckDocNum.Checked
            then begin
                  ResStr:=ResStr+' AND NUM_DOC LIKE '+''''+frmDocFilter.FilterDocNum.Text+'%'+'''';
            end;

            if frmDocFilter.CheckDocSumFrom.Checked
            then begin
                  ResStr:=ResStr+' AND SUMMA>= '+frmDocFilter.FilterDocSumFrom.Text;
            end;

            if frmDocFilter.CheckDocSumTo.Checked
            then begin
                  ResStr:=ResStr+' AND SUMMA<= '+frmDocFilter.FilterDocSumTo.Text;
            end;
    end;

    GetMainSql:=ResStr;
end;

procedure TfrmSprProvs.N1Click(Sender: TObject);
begin
     AddButton.OnClick(self);
end;

procedure TfrmSprProvs.N2Click(Sender: TObject);
begin
     DelButton.OnClick(self);
end;

procedure TfrmSprProvs.N3Click(Sender: TObject);
begin
     UpdateButton.OnClick(self);
end;

procedure TfrmSprProvs.N5Click(Sender: TObject);
begin
     ToolButton1.OnClick(self);
end;

procedure TfrmSprProvs.N6Click(Sender: TObject);
begin
     RefreshButton.OnClick(self);
end;

procedure TfrmSprProvs.CloseButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmSprProvs.N8Click(Sender: TObject);
begin
     CloseButton.OnClick(self);
end;

procedure TfrmSprProvs.CheckGroupPanelClick(Sender: TObject);
begin
          DocsView.OptionsView.GroupByBox:=CheckGroupPanel.Checked;
end;

procedure TfrmSprProvs.cxCheckBox1PropertiesChange(Sender: TObject);
begin
     If cxCheckBox1.Checked
     then begin
          Panel2.Visible:=true;
          Splitter1.Top:=Panel2.Top+1;
     end
     else begin
          Panel2.Visible:=false;
     end;
end;

procedure TfrmSprProvs.AddButtonClick(Sender: TObject);
var tempPK_ID:Int64;
begin
     tempPK_ID:=GlobalSpr.GetDoc(Application.MainForm,WorkDatabase.Handle,0,id_user,true,login,user,work_id_form_kod,frmDocFilter.ActualDate);
     DocsView.BeginUpdate;
     DocsDataSet.Close;
     DocsDataSet.Open;
     DocsDataSet.Locate('PK_ID',IntToStr(tempPK_ID),[]);
     DocsView.EndUpdate;
end;

procedure TfrmSprProvs.N11Click(Sender: TObject);
var
   STRU:KERNEL_MODE_STRUCTURE;
   DoResult:Boolean;
   MSG_STRING:String;
   ErrorList:TStringList;
   i:INteger;
begin
     if fibCheckPermission('/ROOT/Kernell/MBook','Del')=0
     then begin //yes
                    if (DocsDataSet.RecordCount>0)
                    then begin
                         if BaseTypes.agMessageDlg('Уавга?','Ви хочете видалити документ?',mtWarning,[mbYes,mbNo])=mrYes
                         then begin
                             WriteTransaction.StartTransaction;
                             STRU.KEY_SESSION:=WorkDatabase.Gen_Id('KERNEL_GEN_ID_SESSION',1);
                             STRU.DBHANDLE:=WorkDatabase.Handle;
                             STRU.TRHANDLE:=WriteTransaction.Handle;
                             STRU.WORKDATE:=WorkPeriod;
                             STRU.KERNEL_ACTION:=2;
                             STRU.PK_ID:=TFibBCDField(DocsDataSet.FieldByName('PK_ID')).AsInt64;
                             DoResult:=Kernel.KernelDo(@STRU);
                             if DoResult
                             then begin
                                   DocsDataSet.CacheDelete;
                             end
                             else begin
                                   ErrorList:=Kernel.GetDocErrorsListEx(@STRU);
                                   MSG_STRING:='При видаленні документа були виявленні помилки. '+Chr(10)+chr(13);
                                   if ErrorList<>nil
                                   then begin
                                          for i:=0 to  ErrorList.Count-1 do
                                          begin
                                                MSG_STRING:=MSG_STRING+' ПОМИЛКА- '+ErrorList.Strings[i];
                                          end;
                                   end;
                                   ShowMessage(MSG_STRING);
                             end;
                             WriteTransaction.Commit;
                        end;
                    end;
     end
     else begin
                agMessageDlg('Увага!','Ви маєте не маєте права для видалення документів.',mtInformation,[mbOk]);
     end;
end;

procedure TfrmSprProvs.N12Click(Sender: TObject);
var  T:TfrmGetPeriod;
     STRU:KERNEL_MODE_STRUCTURE;
     DoResult:Boolean;
     MSG_STRING:String;
     ErrorList:TStringList;
     i:INteger;
begin
     if fibCheckPermission('/ROOT/Kernell/MBook','Del')=0
     then begin //yes
                    if (DocsDataSet.RecordCount>0)
                    then begin
                         if BaseTypes.agMessageDlg('Уавга?','Ви хочете видалити документ?',mtWarning,[mbYes,mbNo])=mrYes
                         then begin
                                   T:=TfrmGetPeriod.Create(self);
                                   if T.ShowModal=mrYes
                                   then begin
                                             WriteTransaction.StartTransaction;
                                             STRU.KEY_SESSION:=WorkDatabase.Gen_Id('KERNEL_GEN_ID_SESSION',1);
                                             STRU.DBHANDLE:=WorkDatabase.Handle;
                                             STRU.TRHANDLE:=WriteTransaction.Handle;
                                             STRU.WORKDATE:=T.cxDateEdit1.Date;
                                             STRU.KERNEL_ACTION:=2;
                                             STRU.PK_ID:=TFibBCDField(DocsDataSet.FieldByName('PK_ID')).AsInt64;
                                             DoResult:=Kernel.KernelDo(@STRU);
                                             if DoResult
                                             then begin
                                                       //DocsDataSet.CacheDelete;
                                             end
                                             else begin
                                                   ErrorList:=Kernel.GetDocErrorsListEx(@STRU);
                                                   MSG_STRING:='При видаленні документа були виявленні помилки. '+Chr(10)+chr(13);
                                                   if ErrorList<>nil
                                                   then begin
                                                             for i:=0 to  ErrorList.Count-1 do
                                                             begin
                                                                  MSG_STRING:=MSG_STRING+' ПОМИЛКА- '+ErrorList.Strings[i];
                                                             end;
                                                   end;
                                                   ShowMessage(MSG_STRING);
                                             end;
                                             WriteTransaction.Commit;
                                   end;
                        end;
                    end;
     end
     else begin
                agMessageDlg('Увага!','Ви маєте не маєте права для видалення документів.',mtInformation,[mbOk]);
     end;
end;

procedure TfrmSprProvs.N13Click(Sender: TObject);
var tempPK_ID:Int64;
begin
     tempPK_ID:=GlobalSpr.GetDoc(Application.MainForm,WorkDatabase.Handle,0,id_user,true,login,user,work_id_form_kod,frmDocFilter.ActualDate);
     DocsView.BeginUpdate;
     DocsDataSet.Close;
     DocsDataSet.Open;
     DocsDataSet.Locate('PK_ID',IntToStr(tempPK_ID),[]);
     DocsView.EndUpdate;
end;

procedure TfrmSprProvs.N14Click(Sender: TObject);
var  T:TfrmGetPeriod;
     PrepareSp:TpFIBStoredProc;
     STRU:KERNEL_MODE_STRUCTURE;
     DoResult:Boolean;
     MSG_STRING:String;
     ErrorList:TStringList;
     i:INteger;
begin
    if (DocsDataSet.RecordCount>0)
    then begin
         if BaseTypes.agMessageDlg('Увага?','Ви хочете клонувати документ?',mtWarning,[mbYes,mbNo])=mrYes
         then begin
                   T:=TfrmGetPeriod.Create(self);
                   if T.ShowModal=mrYes
                   then begin
                             //Формируем буффер для обработки
                             WriteTransaction.StartTransaction;

                             PrepareSp:=TpFIBStoredProc.Create(self);
                             PrepareSp.Database:=WorkDatabase;
                             PrepareSp.Transaction:=WriteTransaction;
                             PrepareSp.StoredProcName:='PUB_LOAD_FULL_DOC_TO_BUFFER';
                             PrepareSp.Prepare;
                             PrepareSp.ParamByName('PK_ID').asInt64        :=TFibBCDField(DocsDataSet.FieldByName('PK_ID')).AsInt64;
                             PrepareSp.ParamByName('NEW_DATE_PROV').Value  :=T.cxDateEdit1.Date;
                             PrepareSp.ExecProc;
                             STRU.KEY_SESSION:=PrepareSp.ParamByName('KEY_SESSION').AsInt64;
                             STRU.PK_ID      :=PrepareSp.ParamByName('NEW_PK_ID').AsInt64;;
                             PrepareSp.Close;
                             PrepareSp.Free;

                             STRU.DBHANDLE:=WorkDatabase.Handle;
                             STRU.TRHANDLE:=WriteTransaction.Handle;
                             STRU.WORKDATE:=T.cxDateEdit1.Date;
                             STRU.KERNEL_ACTION:=1;

                             DoResult:=Kernel.KernelDo(@STRU);
                             if DoResult
                             then begin
                                       BaseTypes.agMessageDlg('Увaга?','Документ клоновано успішно!',mtWarning,[mbOk]);
                             end
                             else begin
                                   ErrorList:=Kernel.GetDocErrorsListEx(@STRU);
                                   MSG_STRING:='При клонуванні документа були виявленні помилки. '+Chr(10)+chr(13);
                                   if ErrorList<>nil
                                   then begin
                                             for i:=0 to  ErrorList.Count-1 do
                                             begin
                                                  MSG_STRING:=MSG_STRING+' ПОМИЛКА - '+ErrorList.Strings[i];
                                             end;
                                   end;
                                   ShowMessage(MSG_STRING);
                             end;
                             WriteTransaction.Commit;
                   end;
        end;
    end;
end;

end.
