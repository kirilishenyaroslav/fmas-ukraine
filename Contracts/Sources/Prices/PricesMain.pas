{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
unit PricesMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, ComCtrls, ToolWin, ImgList, cxStyles, cxGraphics,
  cxCustomData, cxTL, cxControls, cxInplaceContainer, cxTLData, cxDBTL,
  cxMaskEdit, Menus, pFibStoredProc, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, cxTextEdit, cn_Common_Types, ActnList,
  cn_Common_Funcs, CnConsts;
type
  TfrmPricesMain = class(TForm)
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    ToolBar3: TToolBar;
    AddPeriodButton: TToolButton;
    DelPeriodButton: TToolButton;
    UpdatePeriodButton: TToolButton;
    TreeListView: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn3: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn4: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn5: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn6: TcxDBTreeListColumn;
    AddPopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    PopupMenuDelete: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    PopupMenuUpdate: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    TreeDataSet: TpFIBDataSet;
    TreeDataSource: TDataSource;
    backbold: TcxStyle;
    ToolButton1: TToolButton;
    ExitButton: TToolButton;
    LargeImages: TImageList;
    ToolButton4: TToolButton;
    ToolButton2: TToolButton;
    PrintPopupMenu: TPopupMenu;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ActionList1: TActionList;
    ActionExit: TAction;
    procedure AddPeriodButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure TreeListViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N3Click(Sender: TObject);
    procedure DelPeriodButtonClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure TreeListViewDblClick(Sender: TObject);
    procedure UpdatePeriodButtonClick(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure TreeListViewEnter(Sender: TObject);
    Procedure openPriceReestr;
    procedure TreeListViewKeyPress(Sender: TObject; var Key: Char);
    procedure ActionExitExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_user:int64;
    PLanguageIndex:integer;
    constructor Create(AOwner:TComponent; DbHandle:TISC_DB_HANDLE; id_user:Int64);reintroduce;
  end;



implementation

uses AddYearForm, AddPriceForm, BaseTypes, UDefaults, PricesInterface, cn_PriceReestrPrint,
     cn_FilterPrint, UParamsReestr;

{$R *.dfm}

{ TForm1 }

constructor TfrmPricesMain.Create(AOwner:TComponent; DbHandle:TISC_DB_HANDLE; id_user:Int64);
begin
     inherited Create(AOwner);
     self.id_user:=id_user;

     PLanguageIndex:= cn_Common_Funcs.cnLanguageIndex;
     ExitButton.Caption    := cn_ExitBtn_Caption[PLanguageIndex];
     ExitButton.Hint       := cn_ExitBtn_Caption[PLanguageIndex];

     WorkDatabase.Handle:=DbHandle;
     WorkDatabase.Open;
     ReadTransaction.StartTransaction;
     TreeDataSet.SelectSQL.Text:='SELECT * FROM CN_PRICES_GET_PRICES_TREE';
     TreeDataSet.Open;
end;

procedure TfrmPricesMain.AddPeriodButtonClick(Sender: TObject);
  var T:TfrmGetYear;
      InsertSP:TpFibStoredProc;
      ID_YEAR:Int64;
begin
     T:=TfrmGetYear.Create(self, Date, Date+32);
     if (T.ShowModal=mrYes)
     then begin
               InsertSP:=TpFibStoredProc.Create(self);
               InsertSP.Database:=WorkDatabase;
               InsertSP.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               InsertSP.StoredProcName:='CN_PRICES_AKGOD_INSERT';
               InsertSP.ParamByName('BEG_YEAR').Value:=T.DateBegOut;
               InsertSP.ParamByName('END_YEAR').Value:=T.DateEndOut;
               InsertSP.ExecProc;
               ID_YEAR:=StrToInt64(InsertSP.ParamByName('ID_YEAR').ASString);
               WriteTransaction.Commit;
               InsertSP.Free;
               TreeDataSet.CloseOpen(true);
               TreeDataSet.Locate('ID_YEAR',ID_YEAR,[]);
     end;
     T.Free;
end;

procedure TfrmPricesMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmPricesMain.N1Click(Sender: TObject);
  var T:TfrmGetYear;
      InsertSP:TpFibStoredProc;
      ID_YEAR:Int64;
begin
     T:=TfrmGetYear.Create(self, Date, Date+32);
     if (T.ShowModal=mrYes)
     then begin
               InsertSP:=TpFibStoredProc.Create(self);
               InsertSP.Database:=WorkDatabase;
               InsertSP.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               InsertSP.StoredProcName:='CN_PRICES_AKGOD_INSERT';
               InsertSP.ParamByName('BEG_YEAR').Value:=T.DateBegOut;
               InsertSP.ParamByName('END_YEAR').Value:=T.DateEndOut;
               InsertSP.ExecProc;
               ID_YEAR:=StrToInt64(InsertSP.ParamByName('ID_YEAR').ASString);
               WriteTransaction.Commit;
               InsertSP.Free;
               TreeDataSet.CloseOpen(true);
               TreeDataSet.Locate('ID_YEAR',ID_YEAR,[]);
     end;
     T.Free;
end;

procedure TfrmPricesMain.N2Click(Sender: TObject);
var T:TfrmGetPriceInfo;
    InsertSP:TpFibStoredProc;
    ID_PRICE:Int64;
begin
      if (TreeDataSet.RecordCount>0)
      then begin
                 if TreeDataSet.FieldByName('LINK_YEAR').Value=NULL
                 then begin
                           T:=TfrmGetPriceInfo.Create(self,
                                                      TreeDataSet.FieldByName('YEAR_BEG').Value,
                                                      TreeDataSet.FieldByName('YEAR_END').Value);
                           if T.ShowModal=mrYes
                           then begin
                                     InsertSP:=TpFibStoredProc.Create(self);
                                     InsertSP.Database:=WorkDatabase;
                                     InsertSP.Transaction:=WriteTransaction;
                                     WriteTransaction.StartTransaction;
                                     InsertSP.StoredProcName:='CN_PRICES_REESTR_INSERT';
                                     InsertSP.Prepare;
                                     InsertSP.ParamByName('NAME_PRICE').Value:=T.cxTextEdit1.Text;
                                     InsertSP.ParamByName('ID_YEAR').Value:=TreeDataSet.FieldByName('ID_YEAR').Value;
                                     InsertSP.ParamByName('BEG_DATE').Value:=T.DateBegOut;
                                     InsertSP.ParamByName('END_DATE').Value:=T.DateEndOut;
                                     InsertSP.ExecProc;
                                     ID_PRICE:=InsertSP.ParamByName('ID_PRICE').Value;
                                     WriteTransaction.Commit;
                                     TreeDataSet.CloseOpen(true);
                                     TreeDataSet.Locate('ID_PRICE',ID_PRICE,[]);
                                     InsertSP.Free;
                           end;
                           T.Free;
                 end;
      end;
end;

procedure TfrmPricesMain.TreeListViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key=VK_LEFT
     then TreeListView.FocusedNode.Collapse(true);
     if Key=VK_RIGHT
     then TreeListView.FocusedNode.Expand(false);
end;

procedure TfrmPricesMain.N3Click(Sender: TObject);
var DeleteSP:TpFibStoredProc;
begin
     if (TreeDataSet.RecordCount>0)
     then begin
               if  (    TreeDataSet.FieldByName('LINK_YEAR').Value=NULL)
               and (not TreeListView.FocusedNode.HasChildren )
               then begin
                         if BaseTypes.agMessageDlg('Увага!','Ви хотете видалити академічний рік?',mtConfirmation,[mbYes,mbNo])=mrYes
                         then begin
                                   DeleteSP:=TpFibStoredProc.Create(self);
                                   DeleteSP.Database:=WorkDatabase;
                                   DeleteSP.Transaction:=WriteTransaction;
                                   WriteTransaction.StartTransaction;
                                   DeleteSP.StoredProcName:='CN_PRICES_AKGOD_DELETE';
                                   DeleteSP.Prepare;
                                   DeleteSP.ParamByName('ID_YEAR').AsInt64:=StrToInt64(TreeDataSet.FieldByName('ID_YEAR').asString);
                                   DeleteSP.ExecProc;
                                   WriteTransaction.Commit;
                                   TreeDataSet.CacheDelete;
                                   DeleteSP.Free;
                         end;
               end
               else ShowMessage('Не можна видалити академічний рік');
     end;
end;

procedure TfrmPricesMain.DelPeriodButtonClick(Sender: TObject);
var DeleteSP:TpFibStoredProc;
begin
     if (TreeDataSet.RecordCount>0)
     then begin
               if  (    TreeDataSet.FieldByName('LINK_YEAR').Value=NULL)
               and (not TreeListView.FocusedNode.HasChildren )
               then begin
                         if BaseTypes.agMessageDlg('Увага!','Ви бажаєте видалити академічний рік?',mtConfirmation,[mbYes,mbNo])=mrYes
                         then begin
                                   DeleteSP:=TpFibStoredProc.Create(self);
                                   DeleteSP.Database:=WorkDatabase;
                                   DeleteSP.Transaction:=WriteTransaction;
                                   WriteTransaction.StartTransaction;
                                   DeleteSP.StoredProcName:='CN_PRICES_AKGOD_DELETE';
                                   DeleteSP.Prepare;
                                   DeleteSP.ParamByName('ID_YEAR').AsInt64:=StrToInt64(TreeDataSet.FieldByName('ID_YEAR').asString);
                                   DeleteSP.ExecProc;
                                   WriteTransaction.Commit;
                                   TreeDataSet.CacheDelete;
                                   DeleteSP.Free;
                         end;
               end
               else ShowMessage('Не можна видалити академічний рік');
     end;
end;

procedure TfrmPricesMain.N4Click(Sender: TObject);
var DeleteSP:TpFibStoredProc;
begin
     if (TreeDataSet.RecordCount>0)
     then begin
               if  (    TreeDataSet.FieldByName('LINK_YEAR').Value<>NULL)
               then begin
                         if BaseTypes.agMessageDlg('Увага!','Ви бажаєте видалити прейскурант?',mtConfirmation,[mbYes,mbNo])=mrYes
                         then begin
                                   DeleteSP:=TpFibStoredProc.Create(self);
                                   DeleteSP.Database:=WorkDatabase;
                                   DeleteSP.Transaction:=WriteTransaction;
                                   WriteTransaction.StartTransaction;
                                   DeleteSP.StoredProcName:='CN_PRICES_REESTR_DELETE';
                                   DeleteSP.Prepare;
                                   DeleteSP.ParamByName('ID_PRICE').AsInt64:=StrToInt64(TreeDataSet.FieldByName('ID_PRICE').asString);
                                   DeleteSP.ExecProc;
                                   WriteTransaction.Commit;
                                   TreeDataSet.CacheDelete;
                                   DeleteSP.Free;
                         end;
               end
               else ShowMessage('Не можна видалити прейскурант');
     end;
end;

procedure TfrmPricesMain.ToolButton1Click(Sender: TObject);
var ID_TREE:Integer;
begin
               if TreeDataSet.RecordCount>0
               then ID_TREE:=StrToInt64(TreeDataSet.FieldByName('ID_TREE_NODE').ASString)
               else ID_TREE:=-1;
               TreeDataSet.CloseOpen(true);
               TreeDataSet.Locate('ID_TREE_NODE',ID_TREE,[]);
end;

Procedure TfrmPricesMain.openPriceReestr;
Var
 T:TfrmPriceReestr;
begin
  if (TreeDataSet.RecordCount>0) then
   begin
     if (TreeDataSet.FieldByName('LINK_YEAR').Value<>NULL) then
          begin
             T:=TfrmPriceReestr.Create(self, WorkDatabase.Handle, TreeDataSet.FieldByName('ID_PRICE').AsInteger, Id_User);
             T.ShowModal;
             T.Free;
{ GetPrice(Self,WorkDatabase.Handle,
                               StrToInt64(TreeDataSet.FieldByName('ID_PRICE').AsString),
                               id_user);
}
           end;
   end;
End;   
procedure TfrmPricesMain.TreeListViewDblClick(Sender: TObject);
Begin
 openPriceReestr;
end;

procedure TfrmPricesMain.UpdatePeriodButtonClick(Sender: TObject);
  var T:TfrmGetYear;
      UpdateSP:TpFibStoredProc;
      ID_YEAR:Int64;
begin
     T:=TfrmGetYear.Create(self, TreeDataSet.FieldByName('YEAR_BEG_NV').Value,TreeDataSet.FieldByName('YEAR_END_NV').Value);
     if (T.ShowModal=mrYes)
     then begin
               try
                           UpdateSP:=TpFibStoredProc.Create(self);
                           UpdateSP.Database:=WorkDatabase;
                           UpdateSP.Transaction:=WriteTransaction;
                           WriteTransaction.StartTransaction;
                           UpdateSP.StoredProcName:='CN_PRICES_AKGOD_UPDATE';
                           ID_YEAR:=StrToInt64(TreeDataSet.FieldByName('ID_YEAR').ASString);
                           UpdateSP.ParamByName('ID_YEAR').AsInt64 :=ID_YEAR;;
                           UpdateSP.ParamByName('BEG_YEAR').Value:=T.DateBegOut;
                           UpdateSP.ParamByName('END_YEAR').Value:=T.DateEndOut;
                           UpdateSP.ExecProc;
                           WriteTransaction.Commit;
                           UpdateSP.Free;
                           TreeDataSet.CloseOpen(true);
                           TreeDataSet.Locate('ID_YEAR',ID_YEAR,[]);
                except on E:Exception do ShowMessage(e.Message);
                end;
     end;
     T.Free;
end;

procedure TfrmPricesMain.ToolButton4Click(Sender: TObject);
var
     T:TfrmConfigureDefaults;
begin
     T:=TfrmConfigureDefaults.Create(self);
     t.ShowModal;
     t.Free;
end;

procedure TfrmPricesMain.ToolButton5Click(Sender: TObject);
begin
     TreeListViewDblClick(self);
end;

procedure TfrmPricesMain.N5Click(Sender: TObject);
  var T:TfrmGetYear;
      UpdateSP:TpFibStoredProc;
      ID_YEAR:Int64;
begin
     T:=TfrmGetYear.Create(self, TreeDataSet.FieldByName('YEAR_BEG_NV').Value,TreeDataSet.FieldByName('YEAR_END_NV').Value);
     if (T.ShowModal=mrYes)
     then begin
               try
                           UpdateSP:=TpFibStoredProc.Create(self);
                           UpdateSP.Database:=WorkDatabase;
                           UpdateSP.Transaction:=WriteTransaction;
                           WriteTransaction.StartTransaction;
                           UpdateSP.StoredProcName:='CN_PRICES_AKGOD_UPDATE';
                           ID_YEAR:=StrToInt64(TreeDataSet.FieldByName('ID_YEAR').ASString);
                           UpdateSP.ParamByName('ID_YEAR').AsInt64 :=ID_YEAR;;
                           UpdateSP.ParamByName('BEG_YEAR').Value:=T.DateBegOut;
                           UpdateSP.ParamByName('END_YEAR').Value:=T.DateEndOut;
                           UpdateSP.ExecProc;
                           WriteTransaction.Commit;
                           UpdateSP.Free;
                           TreeDataSet.CloseOpen(true);
                           TreeDataSet.Locate('ID_YEAR',ID_YEAR,[]);
                except on E:Exception do ShowMessage(e.Message);
                end;
     end;
     T.Free;
end;

procedure TfrmPricesMain.N7Click(Sender: TObject);
var ViewForm: TfrmFilterPrint;
begin
    if (TreeDataSet.RecordCount>0)
    then begin
      ViewForm:= TfrmFilterPrint.Create(self);
      ViewForm.isPreyskPrint:= 1;
      ViewForm.Caption := ViewForm.Caption + ' - ПРЕЙСКУРАНТ';
      ViewForm.ID_YEAR := TreeDataSet.FieldByName('ID_YEAR').Value;
      ViewForm.Years := ': ' +VarToStr(TreeDataSet.FieldByName('YEAR_BEG').Value) + '-' + VarToStr(TreeDataSet.FieldByName('YEAR_END').Value);
      ViewForm.Db_Handle := WorkDataBase.Handle;
      ViewForm.ShowModal;
    end;
end;

procedure TfrmPricesMain.N8Click(Sender: TObject);
var ViewForm: TfrmFilterPrint;
begin
    if (TreeDataSet.RecordCount>0)
    then begin
      ViewForm:= TfrmFilterPrint.Create(self);
      ViewForm.isPreyskPrint:= 0;
      ViewForm.Caption := ViewForm.Caption + ' - ДЖЕРЕЛА ФІНАНСУВАННЯ';
      ViewForm.ID_YEAR := TreeDataSet.FieldByName('ID_YEAR').Value;
      ViewForm.Years := ': ' +VarToStr(TreeDataSet.FieldByName('YEAR_BEG').Value) + '-' + VarToStr(TreeDataSet.FieldByName('YEAR_END').Value);
      ViewForm.Db_Handle := WorkDataBase.Handle;
      ViewForm.ShowModal;
    end;
end;

procedure TfrmPricesMain.TreeListViewEnter(Sender: TObject);
begin
 showMessage('Enter');
end;

procedure TfrmPricesMain.TreeListViewKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then openPriceReestr;
end;

procedure TfrmPricesMain.ActionExitExecute(Sender: TObject);
begin
  Close;
end;

end.
