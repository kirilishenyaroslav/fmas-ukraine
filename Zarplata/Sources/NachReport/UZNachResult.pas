unit UZNachResult;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, ComCtrls, ToolWin, ImgList, cxStyles,
  Ibase, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  DB, cxDBData, cxTextEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid,pFibDataSet, ExtCtrls, cxGridBandedTableView,
  cxGridDBBandedTableView, cxContainer, cxCheckBox, FIBDataSet,
  cxExportGrid4Link, cxExport, Placemnt, cxCalc, frxClass,
  frxDBSet,Printers, GlobalSpr, AppStruClasses, Menus, ZPrintReport,
  dxStatusBar, ActnList, UZConfigureForm, cxTL, cxLookAndFeelPainters,
  StdCtrls, cxButtons, ZWait, cxCurrencyEdit;

type
  TColumnGroupInfo = record
         GroupIndex:Integer;
         FieldName :String;
  end;

  TfrmZNachResults = class(TForm)
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    columnst: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    SmallImages: TImageList;
    ToolBar1: TToolBar;
    TB_Update: TToolButton;
    TB_Close: TToolButton;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    WorkDatabase: TpFIBDatabase;
    cxGrid3: TcxGrid;
    cxGridLevel2: TcxGridLevel;
    OborView: TcxGridDBBandedTableView;
    SmGrColumn:     TcxGridDBBandedColumn;
    SmColumn:       TcxGridDBBandedColumn;
    DbInSldColumn:  TcxGridDBBandedColumn;
    KrInSldColumn:  TcxGridDBBandedColumn;
    DbColumn:       TcxGridDBBandedColumn;
    PkvColumn:      TcxGridDBBandedColumn;
    cxCheckBox1: TcxCheckBox;
    ResultsDataSet: TpFIBDataSet;
    ResultsDataSource: TDataSource;
    TB_Print: TToolButton;
    TB_Export: TToolButton;
    SaveDialog1: TSaveDialog;
    FormStorage1: TFormStorage;
    ToolButton6: TToolButton;
    frxDBDataset1: TfrxDBDataset;
    PrintDataSet: TpFIBDataSet;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    PopupMenu2: TPopupMenu;
    OldVersion: TMenuItem;
    NewVersion: TMenuItem;
    frxReport1: TfrxReport;
    dxStatusBar1: TdxStatusBar;
    ActionList1: TActionList;
    Esc: TAction;
    Update: TAction;
    PrintF6: TAction;
    Print_CtrlP: TAction;
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
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    RzColumn: TcxGridDBBandedColumn;
    StColumn: TcxGridDBBandedColumn;
    Panel2: TPanel;
    TypeFinanceColumn: TcxGridDBBandedColumn;
    ToolButton1: TToolButton;
    VidoplColumn: TcxGridDBBandedColumn;
    PostColumn: TcxGridDBBandedColumn;
    TarifDigitColumn: TcxGridDBBandedColumn;
    TarifPercentColumn: TcxGridDBBandedColumn;
    CatPersonColumn: TcxGridDBBandedColumn;
    PostGroupColumn: TcxGridDBBandedColumn;
    DepartmentExColumn: TcxGridDBBandedColumn;
    PostShifrColumn: TcxGridDBBandedColumn;
    AddNameColumn: TcxGridDBBandedColumn;
    KodSetup1Column: TcxGridDBBandedColumn;
    KodSetup2Column: TcxGridDBBandedColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TB_UpdateClick(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure TB_CloseClick(Sender: TObject);
    procedure TB_ExportClick(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure TB_PrintClick(Sender: TObject);
    procedure EscExecute(Sender: TObject);
    procedure UpdateExecute(Sender: TObject);
    procedure PrintF6Execute(Sender: TObject);
    procedure Print_CtrlPExecute(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure KodSetup1ColumnGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
  private
    LTS:Char;
    ShowSmGr:Boolean;
    ShowSm:Boolean;
    ShowDep:Boolean;
    ShowTypePost:Boolean;
    ShowPKV:Boolean;
    ShowTypeFinance:Boolean;
    ShowVidOpl:Boolean;
    ShowPost:Boolean;

    ShowTarif:Boolean;
    ShowPostGroup:Boolean;
    ShowParentDep:Boolean;
    ShowPostShifr:Boolean;
    ShowPostAddName:Boolean;
    ShowKodSetup1:Boolean;
    ShowKodSetup2:Boolean;
    ShowCateg:Boolean;

    TypePosadaInfo:Integer;
    TypePostInfo:Integer;
    TypeCategInfo:Integer;
    
    TypeSmGrInfo:Integer;
    TypeSmInfo:Integer;
    TypeDepInfo:Integer;
    TypeTypePostInfo:Integer;
    TypePKVInfo:Integer;
    TypeFinanceInfo:Integer;
    TypeVidOpl:Integer;
  public
    { Public declarations }
    MBookDate:TDateTime;
    DateBeg:TDateTIme;
    DateEnd:TDateTIme;
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer);overload;
    procedure ConfigureGrid;
  end;

implementation


uses cxRadioGroup, cxGridDBDataDefinitions, UZNachResultDetail, dates;
{$R *.dfm}



procedure TfrmZNachResults.ConfigureGrid;
var SQLText:String;
    SeleSch,  SeleSmGr,  SeleSm,  SeleRz,  SeleTf,  SelePost, SeleVO,
    SeleSt,   SelePKV,   SeleTarif, SelePostGroup,  SeleParentDep,
    SelePostShifr,       SeleAddName, SeleKodSetup1,  SeleKodSetup2, SeleCat   :String;
    OredrSch:String;
begin
     Screen.Cursor:=crSQLWait;

     OredrSch:='   DUMMY_FIELD ';
     SeleSch :=' , DUMMY_FIELD ';

     if ShowSmGr then begin
               SmGrColumn.Visible:=true;
               if TypeSmGrInfo=0 then begin
                                           SeleSmGr :=' , smeta_group_kod, id_sm_group';
                                           SmGrColumn.DataBinding.FieldName:='smeta_group_kod';
                                 end;
               if TypeSmGrInfo=1 then begin
                                           SeleSmGr :=' , smeta_group_full, id_sm_group';
                                           SmGrColumn.DataBinding.FieldName:='smeta_group_full';
                                 end;
     end
     else begin
               SmGrColumn.Visible:=false;
               SeleSmGr :='';
     end;

     if ShowPKV then begin
               PKVColumn.Visible:=true;
               if TypePKVInfo=0 then begin
                                           SelePKV :=' , pkv_kod, id_pkv';
                                           PKVColumn.DataBinding.FieldName:='pkv_kod';
                                 end;
               if TypePKVInfo=1 then begin
                                           SelePKV :=' , pkv_full, id_pkv';
                                           PKVColumn.DataBinding.FieldName:='pkv_full';
                                 end;
     end
     else begin
               PKVColumn.Visible:=false;
               SelePKV :='';
     end;

     if ShowSm then begin
               SmColumn.Visible:=true;
               if TypeSmInfo=0 then begin
                                         SeleSm:=' , smeta_kod, id_smeta';
                                         SmColumn.DataBinding.FieldName  :='smeta_kod';
                               end;
               if TypeSmInfo=1 then begin
                                         SeleSm:=' , smeta_full, id_smeta';
                                         SmColumn.DataBinding.FieldName  :='smeta_full';
                               end;
     end
     else begin
               SmColumn.Visible:=false;
               SeleSm:='';
     end;

     if ShowTypeFinance then begin
               TypeFinanceColumn.Visible:=true;
               if TypeFinanceInfo=0 then begin
                                         SeleTf:=' , TYPE_FINANCE_KODE, id_type_finance';
                                         TypeFinanceColumn.DataBinding.FieldName  :='TYPE_FINANCE_KODE';
                               end;
               if TypeFinanceInfo=1 then begin
                                         SeleTf:=' , TYPE_FINANCE_FULL, id_type_finance';
                                         TypeFinanceColumn.DataBinding.FieldName  :='TYPE_FINANCE_FULL';
                               end;
     end
     else begin
               TypeFinanceColumn.Visible:=false;
               SeleTf:='';
     end;


     if (Integer(ShowSmGr)+Integer(ShowPKV)+Integer(ShowSm)+Integer(ShowTypeFinance)=0)
       then OborView.Bands[1].Visible:=false
       else OborView.Bands[1].Visible:=true;


     if ShowDep then begin
               RzColumn.Visible:=true;
               if TypeDepInfo=0 then begin
                                         SeleRz:=' , department_kode, id_department';
                                         RzColumn.DataBinding.FieldName  :='department_kode';
                               end;
               if TypeDepInfo=1 then begin
                                         SeleRz:=' , department_full, id_department';
                                         RzColumn.DataBinding.FieldName  :='department_full';
                               end;
     end
     else begin
               RzColumn.Visible:=false;
               SeleRz:='';
     end;

     if ShowTypePost then begin
               StColumn.Visible:=true;
               if TypeTypePostInfo=0 then begin
                                         SeleSt:=' , type_post_kode,  id_type_post';
                                         StColumn.DataBinding.FieldName  :='type_post_kode';
                               end;
               if TypeTypePostInfo=1 then begin
                                         SeleSt:=' , type_post_full,  id_type_post';
                                         StColumn.DataBinding.FieldName  :='type_post_full';
                               end;
     end
     else begin
               StColumn.Visible:=false;
               SeleSt:='';
     end;

     if ShowPost
     then begin
               PostColumn.Visible:=true;

               SelePost:=' , post_full,  id_post';
               PostColumn.DataBinding.FieldName  :='post_full';
     end
     else begin
               PostColumn.Visible:=false;
               SelePost:='';
     end;

     if ShowVidOpl
     then begin
               VidoplColumn.Visible:=true;
               if TypeVidOpl=0 then begin
                                         SeleVO:=' , vidopl_kode,  id_vidopl';
                                         VidoplColumn.DataBinding.FieldName  :='vidopl_kode';
                               end;
               if TypeVidOpl=1 then begin
                                         SeleVO:=' , vidopl_full,  id_vidopl';
                                         VidoplColumn.DataBinding.FieldName  :='vidopl_full';
                               end;
     end
     else begin
               VidoplColumn.Visible:=false;
               SeleVO:='';
     end;

     if ShowCateg
     then begin
               CatPersonColumn.Visible:=true;
               if TypeCategInfo=0 then begin
                                         SeleCat:=' , cat_code,  id_category';
                                         CatPersonColumn.DataBinding.FieldName  :='CAT_CODE';
                               end;
               if TypeCategInfo=1 then begin
                                         SeleCat:=' , cat_name,  id_category';
                                         CatPersonColumn.DataBinding.FieldName  :='CAT_NAME';
                               end;
     end
     else begin
               CatPersonColumn.Visible:=false;
               SeleCat:='';
     end;

     if ShowTarif
     then begin
               TarifDigitColumn.Visible:=true;
               TarifPercentColumn.Visible:=true;

               SeleTarif:=' , tarif_razr,  koef';
               TarifDigitColumn.DataBinding.FieldName  :='TARIF_RAZR';
               TarifPercentColumn.DataBinding.FieldName :='KOEF';
     end
     else begin
               TarifDigitColumn.Visible:=false;
               TarifPercentColumn.Visible:=false;
               SeleTarif:='';
     end;

     if ShowPostGroup
     then begin
               PostGroupColumn.Visible:=true;
               SelePostGroup:=' ,NAME_POST_GROUP, id_group ';
               PostGroupColumn.DataBinding.FieldName :='NAME_POST_GROUP';
     end
     else begin
               PostGroupColumn.Visible:=false;
               SelePostGroup:='';
     end;

     if ShowParentDep
     then begin
               DepartmentExColumn.Visible:=true;
               SeleParentDep:=' ,id_department_ex, department_full_ex ';
               DepartmentExColumn.DataBinding.FieldName :='DEPARTMENT_FULL_EX';
     end
     else begin
               DepartmentExColumn.Visible:=false;
               SeleParentDep:='';
     end;

     if ShowPostShifr
     then begin
               PostShifrColumn.Visible:=true;
               SelePostShifr:=' ,shifr ';
               PostShifrColumn.DataBinding.FieldName :='SHIFR';
     end
     else begin
               PostShifrColumn.Visible:=false;
               SelePostShifr:='';
     end;

     if ShowPostAddName
     then begin
               AddNameColumn.Visible:=true;
               SeleAddName:=' ,ADD_NAME ';
               AddNameColumn.DataBinding.FieldName :='ADD_NAME';
     end
     else begin
               AddNameColumn.Visible:=false;
               SeleAddName:='';
     end;

     if ShowKodSetup1
     then begin
               KodSetup1Column.Visible:=true;
              // SeleKodSetup1:=' ,kod_setup1_str ';
               SeleKodSetup1:=' ,PERIOD_RASSCHET ';
              // KodSetup1Column.DataBinding.FieldName :='KOD_SETUP1_STR';
               KodSetup1Column.DataBinding.FieldName :='PERIOD_RASSCHET';
     end
     else begin
               KodSetup1Column.Visible:=false;
               SeleKodSetup1:='';
     end;

     if ShowKodSetup2
     then begin
               KodSetup2Column.Visible:=true;
              // SeleKodSetup2:=' ,kod_setup2_str ';
               SeleKodSetup2:=' ,PERIOD_NACHISL ';
               //KodSetup2Column.DataBinding.FieldName :='KOD_SETUP2_STR';
               KodSetup2Column.DataBinding.FieldName :='PERIOD_NACHISL';

     end
     else begin
               KodSetup2Column.Visible:=false;
               SeleKodSetup2:='';
     end;


     if (Integer(ShowTypePost)+Integer(ShowDep)+Integer(ShowPost)+Integer(ShowVidOpl)+
         Integer(ShowTarif)+Integer(ShowPostGroup)+Integer(ShowParentDep)+Integer(ShowPostShifr)+
         Integer(ShowPostAddName)+Integer(ShowKodSetup1)+Integer(ShowKodSetup2)+Integer(ShowCateg)=0)
        then OborView.Bands[0].Visible:=false
        else OborView.Bands[0].Visible:=true;



     if ResultsDataSet.Active then ResultsDataSet.Close;

     SQLText:='SELECT SUM(fzp) AS fzp, SUM(fss) AS fss, SUM(fbl) AS fbl '+SeleSch + SeleSmGr + SeleSm + SeleRz + SeleSt + SelePKV + SeleTf + SelePost + SeleVO + SeleTarif + SelePostGroup + SeleParentDep + SelePostShifr + SeleAddName + SeleKodSetup1 + SeleKodSetup2 + SeleCat +
              ' FROM Z_UTIL_NACH_REPORT_DETAIL('+''''+DateToStr(DateBeg)+''''+','+''''+DateToStr(DateEnd)+''''+')'+
              ' GROUP BY '+ OredrSch + SeleSmGr + SeleSm + SeleRz + SeleSt  + SelePKV+SeleTf + SelePost + SeleVO + SeleTarif + SelePostGroup + SeleParentDep + SelePostShifr + SeleAddName + SeleKodSetup1 + SeleKodSetup2 + SeleCat;

     ResultsDataSet.SelectSQL.Text:=SQLText;
     ResultsDataSet.Open;

     Screen.Cursor:=crDefault;
end;

constructor TfrmZNachResults.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; Id_User: Integer);
var T:TfrmZGetConfInfo;
    TempdataSet:TpFibDataSet;
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DBHandle;
     ReadTransaction.StartTransaction;

     TempdataSet:=TpFibDataSet.Create(self);
     TempdataSet.Database:=WorkDatabase;
     TempdataSet.Transaction:=ReadTransaction;
     TempdataSet.SQLs.SelectSQL.Text:='SELECT * FROM PUB_SYS_DATA';
     TempdataSet.Open;
     MBookDate:=TempdataSet.FieldByName('MAIN_BOOK_DATE').AsDateTime;
     TempdataSet.Close;
     TempdataSet.Free;

     T:=TfrmZGetConfInfo.Create(self,MBookDate,MBookDate);


     if T.ShowModal=mrYes
     then begin
               DateBeg :=T.DateBeg;
               DateEnd :=T.DateEnd;

               ShowSmGr           :=T.ShowSmGr.Checked;
               ShowSm             :=T.ShowSm.Checked;
               ShowDep            :=T.ShowDep.Checked;
               ShowTypePost       :=T.ShowTypePost.Checked;
               ShowPKV            :=T.ShowProgram.Checked;
               ShowTypeFinance    :=T.ShowTypeFinance.Checked;
               ShowVidOpl         :=T.ShowVidOpl.Checked;
               ShowPost           :=T.ShowPost.Checked;

               TypeSmGrInfo       :=T.edTypeSmGrInfo.ItemIndex;
               TypeSmInfo         :=T.edTypeSmInfo.ItemIndex;
               TypeDepInfo        :=T.edTypeDepInfo.ItemIndex;
               TypePKVInfo        :=T.edProgramInfo.ItemIndex;
               TypeFinanceInfo    :=T.edTypeFinanceInfo.ItemIndex;
               TypeVidOpl         :=T.edTypeVidOpl.ItemIndex;

               ShowTarif          :=T.ShowTarif.Checked;
               ShowPostGroup      :=T.ShowPostGroup.Checked;
               ShowParentDep      :=T.ShowParentDep.Checked;
               ShowPostShifr      :=T.ShowPostShifr.Checked;
               ShowPostAddName    :=T.ShowPostAddName.Checked;
               ShowKodSetup1      :=T.ShowKodSetup1.Checked;
               ShowKodSetup2      :=T.ShowKodSetup2.Checked;
               ShowCateg          :=T.ShowCateg.Checked;

               TypePosadaInfo     :=T.edTypePosada.ItemIndex;
               TypeCategInfo      :=T.edTypeCateg.ItemIndex;
               TypeTypePostInfo   :=T.edTypePost.ItemIndex;

               ConfigureGrid;
     end
     else PostMessage(Self.Handle,WM_CLOSE,0,0);

     T.Free;

     LTS:=ThousandSeparator;
     ThousandSeparator:=#0;
end;

procedure TfrmZNachResults.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     ThousandSeparator:=LTS;
     Action:=caFree;
end;

procedure TfrmZNachResults.TB_UpdateClick(Sender: TObject);
var T:TfrmZGetConfInfo;
    i:short;
begin
     T:=TfrmZGetConfInfo.Create(self,self.DateBeg, self.DateEnd);

     T.edTypeSmGrInfo.ItemIndex   :=TypeSmGrInfo;
     T.edTypeSmInfo.ItemIndex     :=TypeSmInfo;
     T.edTypeDepInfo.ItemIndex    :=TypeDepInfo;
     T.edProgramInfo.ItemIndex    :=TypePKVInfo;
     T.edTypeFinanceInfo.ItemIndex:=TypeFinanceInfo;
     T.edTypeVidOpl.ItemIndex     :=TypeVidOpl;

     T.ShowSmGr.Checked           :=ShowSmGr;
     T.ShowSm.Checked             :=ShowSm;
     T.ShowDep.Checked            :=ShowDep;
     T.ShowTypePost.Checked       :=ShowTypePost;
     T.ShowProgram.Checked        :=ShowPKV;
     T.ShowTypeFinance.Checked    :=ShowTypeFinance;
     T.ShowVidOpl.Checked         :=ShowVidOpl;

     T.ShowTarif.Checked          :=ShowTarif;
     T.ShowPostGroup.Checked      :=ShowPostGroup;
     T.ShowParentDep.Checked      :=ShowParentDep;
     T.ShowPostShifr.Checked      :=ShowPostShifr;
     T.ShowPostAddName.Checked    :=ShowPostAddName;
     T.ShowKodSetup1.Checked      :=ShowKodSetup1;
     T.ShowKodSetup2.Checked      :=ShowKodSetup2;
     T.ShowCateg.Checked          :=ShowCateg;

     T.edTypePosada.ItemIndex     :=TypePosadaInfo;
     T.edTypeCateg.ItemIndex      :=TypeCategInfo;

     if T.ShowModal=mrYes
     then begin
               DateBeg :=T.DateBeg;
               DateEnd :=T.DateEnd;

               if      (ShowSmGr        and not T.ShowSmGr.Checked)
                    or (ShowSm          and not T.ShowSm.Checked)
                    or (ShowDep         and not T.ShowDep.Checked)
                    or (ShowTypePost    and not T.ShowTypePost.Checked)
                    or (ShowPKV         and not T.ShowProgram.Checked)
                    or (ShowTypeFinance and not T.ShowTypeFinance.Checked)
                    or (ShowVidOpl      and not T.ShowVidOpl.Checked)
                    or (ShowPost        and not T.ShowPost.Checked)
                    or (ShowTarif       and not T.ShowTarif.Checked)
                    or (ShowPostGroup   and not T.ShowPostGroup.Checked)
                    or (ShowParentDep   and not T.ShowParentDep.Checked)
                    or (ShowPostShifr   and not T.ShowPostShifr.Checked)
                    or (ShowPostAddName and not T.ShowPostAddName.Checked)
                    or (ShowKodSetup1   and not T.ShowKodSetup1.Checked)
                    or (ShowKodSetup2   and not T.ShowKodSetup2.Checked)
                    or (ShowCateg       and not T.ShowCateg.Checked)

               then begin
                          OborView.OptionsView.GroupByBox:=false;
                          cxCheckBox1.Checked:=false;
                          for i:=0 to OborView.ColumnCount-1 do
                               OborView.Columns[i].GroupIndex:=-1;
               end;

               ShowSmGr:=T.ShowSmGr.Checked;
               ShowSm  :=T.ShowSm.Checked;
               ShowDep  :=T.ShowDep.Checked;
               ShowTypePost  :=T.ShowTypePost.Checked;
               ShowPKV :=T.ShowProgram.Checked;
               ShowTypeFinance:=T.ShowTypeFinance.Checked;
               ShowVidOpl:=T.ShowVidOpl.Checked;
               ShowPost:=T.ShowPost.Checked;

               TypeSmGrInfo :=T.edTypeSmGrInfo.ItemIndex;
               TypeSmInfo   :=T.edTypeSmInfo.ItemIndex;
               TypeDepInfo   :=T.edTypeDepInfo.ItemIndex;
               TypePKVInfo  :=T.edProgramInfo.ItemIndex;
               TypeFinanceInfo:=T.edTypeFinanceInfo.ItemIndex;
               TypeVidOpl:=T.edTypeVidOpl.ItemIndex;

               ShowTarif          :=T.ShowTarif.Checked;
               ShowPostGroup      :=T.ShowPostGroup.Checked;
               ShowParentDep      :=T.ShowParentDep.Checked;
               ShowPostShifr      :=T.ShowPostShifr.Checked;
               ShowPostAddName    :=T.ShowPostAddName.Checked;
               ShowKodSetup1      :=T.ShowKodSetup1.Checked;
               ShowKodSetup2      :=T.ShowKodSetup2.Checked;
               ShowCateg          :=T.ShowCateg.Checked;

               TypePosadaInfo     :=T.edTypePosada.ItemIndex;
               TypeCategInfo      :=T.edTypeCateg.ItemIndex;
               TypeTypePostInfo   :=T.edTypePost.ItemIndex;

               ConfigureGrid;
     end;
     T.Free;
end;

procedure TfrmZNachResults.cxCheckBox1PropertiesChange(Sender: TObject);
var i:short;
begin
    OborView.OptionsView.GroupByBox:=cxCheckBox1.Checked;
    if cxCheckBox1.Checked=false then
          for i:=0 to OborView.ColumnCount-1 do
            OborView.Columns[i].GroupIndex:=-1;
end;

procedure TfrmZNachResults.TB_CloseClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmZNachResults.TB_ExportClick(Sender: TObject);
begin
      if SaveDialog1.Execute
      then begin
                ExportGrid4ToExcel(SaveDialog1.FileName, cxGrid3, false, true, false);
      end;
end;

procedure TfrmZNachResults.ToolButton6Click(Sender: TObject);
var I:Integer;
begin
     for i:=0 to OborView.ColumnCount-1 do
        OborView.Columns[i].Options.Filtering:=ToolButton6.Down;
end;


procedure TfrmZNachResults.TB_PrintClick(Sender: TObject);
var
  sortindex     :array of short;
  GroupColCnt   :Integer;
  OtherColCnt   :Integer;
  i,j,n,m,sumwidth:integer;
  str           :string;
  t             :Real48;
  form          :TPrintReport;
begin
  GroupColCnt:=0;
  OtherColCnt:=0;
  sumwidth:=0;
  m:=0;
  n:=0;

  PrintDataSet.Close;
  PrintDataSet.SQLs.SelectSQL.text:=ResultsDataSet.SQLs.SelectSQL.text;

  form:=TPrintReport.Create(self);
  form.inquiry:=ResultsDataSet.SQLs.SelectSQL.text;

  form.FIBDataSet:=PrintDataSet;
  form.frxReport:=frxReport1;
  form.frxDBDataSet:=frxDBDataset1;
  form.strTitle:='Аналіз нарахувань заробітної плати '+Panel2.Caption;

  for i:=0 to OborView.ColumnCount-1 do begin
    if  (OborView.Columns[i].DataBinding.FieldName<>'fzp')
    and (OborView.Columns[i].DataBinding.FieldName<>'fss')
    and (OborView.Columns[i].DataBinding.FieldName<>'fbl')
    and (OborView.Columns[i].GroupIndex>-1) then begin
      Inc(GroupColCnt);
      sumwidth:=sumwidth+OborView.Columns[i].Width;
    end
    else if (OborView.Columns[i].Visible) then begin
      Inc(OtherColCnt);
      sumwidth:=sumwidth+OborView.Columns[i].Width;
    end;
  end;
  form.n:=GroupColCnt;
  form.m:=OtherColCnt;
  SetLength(sortindex,GroupColCnt);
  SetLength(form.FieldstoOrder,GroupColCnt);
  SetLength(form.OtherFields,OtherColCnt);

  for i:=0 to OtherColCnt-1 do form.OtherFields[i].aggregative_function:='';
  for i:=0 to GroupColCnt-1 do form.FieldstoOrder[i].aggregative_function:='';

  for i:=0 to OborView.ColumnCount-1 do begin
    if (OborView.Columns[i].GroupIndex>-1)
    then begin
              sortindex[n]:=OborView.Columns[i].GroupIndex;
              form.FieldstoOrder[n].fieldname:=OborView.Columns[i].DataBinding.FieldName;
              form.FieldstoOrder[n].caption:=OborView.Columns[i].Caption;
              form.FieldstoOrder[n].width:=OborView.Columns[i].Width/sumwidth;
              if OborView.Columns[i].SortOrder=soAscending then form.FieldstoOrder[n].order:=1
              else form.FieldstoOrder[n].order:=0;
              Inc(n);
    end
    else if (OborView.Columns[i].Visible) then begin
      form.OtherFields[m].fieldname:=OborView.Columns[i].DataBinding.FieldName;
      form.OtherFields[m].caption:=OborView.Columns[i].Caption;
      form.OtherFields[m].width:=OborView.Columns[i].Width/sumwidth;
      form.OtherFields[m].alignment:=OborView.Columns[i].FooterAlignmentHorz;

      if (OborView.Columns[i].DataBinding.FieldName='fss') or
         (OborView.Columns[i].DataBinding.FieldName='fzp') or
         (OborView.Columns[i].DataBinding.FieldName='fbl')
          then
           form.OtherFields[m].aggregative_function:='SUM';
      Inc(m);
    end;
  end;
  for i:=0 to GroupColCnt-2 do begin
    for j:=i+1 to GroupColCnt-1 do begin
      if sortindex[i]>sortindex[j] then begin
        sortindex[i]:=sortindex[i]+sortindex[j];
        sortindex[j]:=sortindex[i]-sortindex[j];
        sortindex[i]:=sortindex[i]-sortindex[j];

        str:=form.FieldstoOrder[i].fieldname;
        form.FieldstoOrder[i].fieldname:=form.FieldstoOrder[j].fieldname;
        form.FieldstoOrder[j].fieldname:=str;
        str:=form.FieldstoOrder[i].Caption;
        form.FieldstoOrder[i].Caption:=form.FieldstoOrder[j].Caption;
        form.FieldstoOrder[j].Caption:=str;
        str:=form.FieldstoOrder[i].aggregative_function;
        form.FieldstoOrder[i].aggregative_function:=form.FieldstoOrder[j].aggregative_function;
        form.FieldstoOrder[j].aggregative_function:=str;
        t:=form.FieldstoOrder[i].Width;
        form.FieldstoOrder[i].Width:=form.FieldstoOrder[j].Width;
        form.FieldstoOrder[j].Width:=t;
        form.FieldstoOrder[i].Order:=form.FieldstoOrder[i].Order+form.FieldstoOrder[j].Order;
        form.FieldstoOrder[j].Order:=form.FieldstoOrder[i].Order-form.FieldstoOrder[j].Order;
        form.FieldstoOrder[i].Order:=form.FieldstoOrder[i].Order-form.FieldstoOrder[j].Order;
      end;
    end;
  end;
  form.ShowModal;
  form.Free;
end;

procedure TfrmZNachResults.EscExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmZNachResults.UpdateExecute(Sender: TObject);
begin
  TB_Update.OnClick(self);
end;

procedure TfrmZNachResults.PrintF6Execute(Sender: TObject);
begin
  TB_Print.OnClick(self);
end;

procedure TfrmZNachResults.Print_CtrlPExecute(Sender: TObject);
begin
  TB_Print.OnClick(self);
end;

procedure TfrmZNachResults.ToolButton1Click(Sender: TObject);
var id_sm, id_sm_gr, id_pkv, id_tf, id_tp, id_dep, id_p, id_vo : Variant;
    wf:TForm;
begin
    wf:=ShowWaitForm(Self);

     if (ResultsDataSet.Fields.FindField('smeta_kod')<>nil)
     or (ResultsDataSet.Fields.FindField('smeta_full')<>nil)
     then id_sm    :=ResultsDataSet.FieldByName('id_smeta').Value
     else id_sm    :=null;

     if (ResultsDataSet.Fields.FindField('smeta_group_kod')<>nil)
     or (ResultsDataSet.Fields.FindField('smeta_group_full')<>nil)
     then id_sm_gr    :=ResultsDataSet.FieldByName('id_sm_group').Value
     else id_sm_gr    :=null;

     if (ResultsDataSet.Fields.FindField('pkv_kod')<>nil)
     or (ResultsDataSet.Fields.FindField('pkv_full')<>nil)
     then id_pkv    :=ResultsDataSet.FieldByName('id_pkv').Value
     else id_pkv    :=null;

     if (ResultsDataSet.Fields.FindField('type_finance_kode')<>nil)
     or (ResultsDataSet.Fields.FindField('type_finance_full')<>nil)
     then id_tf    :=ResultsDataSet.FieldByName('id_type_finance').Value
     else id_tf    :=null;

     if (ResultsDataSet.Fields.FindField('department_kode')<>nil)
     or (ResultsDataSet.Fields.FindField('department_full')<>nil)
     then id_dep    :=ResultsDataSet.FieldByName('id_department').Value
     else id_dep    :=null;

     if (ResultsDataSet.Fields.FindField('type_post_kode')<>nil)
     or (ResultsDataSet.Fields.FindField('type_post_full')<>nil)
     then id_tp    :=ResultsDataSet.FieldByName('id_type_post').Value
     else id_tp    :=null;

     if (ResultsDataSet.Fields.FindField('post_kode')<>nil)
     or (ResultsDataSet.Fields.FindField('post_full')<>nil)
     then id_p    :=ResultsDataSet.FieldByName('id_post').Value
     else id_p    :=null;

     if (ResultsDataSet.Fields.FindField('vidopl_kode')<>nil)
     or (ResultsDataSet.Fields.FindField('vidopl_full')<>nil)
     then id_vo    :=ResultsDataSet.FieldByName('id_vidopl').Value
     else id_vo    :=null;

     with TfrmNachDetailReport.Create(self,
                                      DateBeg,
                                      DateEnd,
                                      id_sm,
                                      id_sm_gr,
                                      id_pkv,
                                      id_tf,
                                      id_dep,
                                      id_tp,
                                      id_p,
                                      id_vo,
                                      WorkDatabase.Handle) do
     begin
           CloseWaitForm(wf);
           ShowModal;
           Free;
     end;

end;

procedure TfrmZNachResults.KodSetup1ColumnGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
     //Atext:=KodSetupToPeriod(StrToInt(Atext),1);
end;

end.
