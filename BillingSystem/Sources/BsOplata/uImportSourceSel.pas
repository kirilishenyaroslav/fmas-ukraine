unit uImportSourceSel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit, ImgList,
  cxClasses, cxGridTableView, FIBDatabase, pFIBDatabase, FIBQuery,
  pFIBQuery, pFIBStoredProc, ActnList, DB, FIBDataSet, pFIBDataSet, dxBar,
  dxBarExtItems, cxInplaceContainer, cxDBTL, cxControls, cxTLData,uCommon_Funcs, uConsts,
  uCommon_Messages, uCommon_Types,  AccMGMT,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxTextEdit,
  cxGridLevel, cxGridCustomTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, uMainOplata;

type
  TfrmImportSourceSel = class(TForm)
    LgotBarManager: TdxBarManager;
    btnAdd: TdxBarLargeButton;
    btnDel: TdxBarLargeButton;
    btnRefresh: TdxBarLargeButton;
    dxBarDateCombo1: TdxBarDateCombo;
    dxBarLargeButton4: TdxBarLargeButton;
    btnLgotSwitch: TdxBarLargeButton;
    btnEdit: TdxBarLargeButton;
    btnAddLgotParent: TdxBarLargeButton;
    btnAddLgotChild: TdxBarLargeButton;
    btnLgotCLose: TdxBarLargeButton;
    btnLgotDel: TdxBarLargeButton;
    ImportSourceDS: TDataSource;
    ImportSelDSet: TpFIBDataSet;
    LgotActList: TActionList;
    ActionSel: TAction;
    ActClose: TAction;
    ImportTrans: TpFIBTransaction;
    ImageList1: TImageList;
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    name_source: TcxGridDBColumn;
    GridLevel: TcxGridLevel;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    procedure ActCloseExecute(Sender: TObject);
    procedure ActionSelExecute(Sender: TObject);
  private
    PLanguageIndex: byte;
    //DM            : TMainOpl_DM;
    myform        : TfrmMainOplata;
    id_doc_ini_in, type_doc_in : integer;
    name_source_in, name_path_in, proc_name_in : string;
  public
    res:Variant;
    Is_admin:Boolean;
  end;
   function ShowImportSourceSel(dbase : TpFIBDatabase;var id_doc_ini_out : integer; var name_source_out : string;var type_doc_out,count_out :integer;var name_path_out, proc_name_out :string):boolean;

{var
  frmImportSourceSel: TfrmImportSourceSel;}

implementation


{$R *.dfm}


function ShowImportSourceSel(dbase : TpFIBDatabase;var id_doc_ini_out : integer; var name_source_out : string;var type_doc_out,count_out :integer;var name_path_out, proc_name_out :string):boolean;
var
    T : TfrmImportSourceSel;
begin
    T := TfrmImportSourceSel.Create(nil);
    //T.Db  := dbase;
    //T.Import
    T.ImportSelDSet.Database := dbase;
    T.ImportSelDSet.Transaction := T.ImportTrans;
    T.ImportSelDSet.Transaction.StartTransaction;
    T.ImportSelDSet.Close;
    T.ImportSelDSet.SQLs.SelectSQL.Text := 'select * from BS_IMPORT_DOC_INI_SEL';
    T.ImportSelDSet.Open;
    T.ImportSelDSet.FetchAll;


    if T.ShowModal=mrOk then
    begin
        id_doc_ini_out   :=  T.id_doc_ini_in;
        name_source_out  :=  T.name_source_in;
        type_doc_out     :=  T.type_doc_in;
        name_path_out    :=  T.name_path_in;
        proc_name_out    :=  T.proc_name_in;
        count_out        :=  T.ImportSelDSet.RecordCount;

        Result := true;
    end  else
        Result := false;

    T.ImportSelDSet.Close;
    T.Free
end;



procedure TfrmImportSourceSel.ActCloseExecute(Sender: TObject);
begin
   close;
end;

procedure TfrmImportSourceSel.ActionSelExecute(Sender: TObject);
begin
    id_doc_ini_in := ImportSelDSet['ID_DOC_INI'];

    if ImportSelDSet['NAME_SOURCE']<>null then
         name_source_in := ImportSelDSet['NAME_SOURCE']
    else
         name_source_in := '';

    if ImportSelDSet['TYPE_DOC']<>null then
         type_doc_in:= ImportSelDSet['TYPE_DOC']
    else
         type_doc_in := 0;

    if ImportSelDSet['PATH_FOLDER']<>null then
         name_path_in:= ImportSelDSet['PATH_FOLDER']
    else
         name_path_in := '';

    if ImportSelDSet['IMPORT_PROCEDURE']<>null then
         proc_name_in:= ImportSelDSet['IMPORT_PROCEDURE']
    else
         proc_name_in := '';

    ModalResult := mrOk;

end;

end.
