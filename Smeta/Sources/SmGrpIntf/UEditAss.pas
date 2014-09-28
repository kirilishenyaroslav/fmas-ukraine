unit UEditAss;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, FIBDatabase, pFIBDatabase,
  cxDropDownEdit, cxCalc, StdCtrls, cxRadioGroup, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxButtons, Ibase,
  pFibDataSet, ActnList, pFibStoredProc, ImgList, cxStyles, ExtCtrls,
  ComCtrls, ToolWin, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  FIBDataSet;

type
  TFrmFormulaEdit = class(TForm)
    WorkDatabase:TpFIBDatabase;
    ReadTransaction:TpFIBTransaction;
    WriteTransaction:TpFibTransaction;
    cxButtonEdit1:TcxButtonEdit;
    label1:TLabel;
    label5:TLabel;
    cxButton1:TcxButton;
    cxButton2:TcxButton;
    Label4: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    GroupBox1: TGroupBox;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    Panel1: TPanel;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    cxStyle1: TcxStyle;
    SmallImages: TImageList;
    ToolBar6: TToolBar;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    cxGrid6: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    FormulaDataSet: TpFIBDataSet;
    FormulaDataSource: TDataSource;
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure ToolButton17Click(Sender: TObject);
    procedure ToolButton18Click(Sender: TObject);
    procedure ToolButton19Click(Sender: TObject);
  private
    { Private declarations }
    function CheckData:Boolean;
  public
    ID_RAZD_SOURCE:Integer;
    ID_TARGET_OBJ:Integer;
    SOURCE_RAZD_ST_NUM:String;
    SOURCE_RAZD_ST_TITLE:String;
    TARGET_RAZD_ST_NUM:String;
    TARGET_RAZD_ST_TITLE:String;
    lis_edit:Boolean;
    lid_period:Integer;
    ID_FORMULA:Integer;
    LId_Source:Integer;
    { Public declarations }
    constructor Create(AOwner:TComponent;DbHandle:TISC_DB_HANDLE;id_user:Int64; is_edit:Boolean;id_period:Integer=0;id_source:Integer=0);reintroduce;
  end;

implementation

{$R *.dfm}


uses GlobalSpr, FIBQuery, UEditAssTable, BaseTypes;

constructor TFrmFormulaEdit.Create(AOwner: TComponent;
  DbHandle: TISC_DB_HANDLE; id_user: Int64; is_edit:Boolean; id_period:Integer=0; id_source:Integer=0);
begin
     inherited Create(Aowner);

     WorkDatabase.Handle:=DbHandle;
     ReadTransaction.StartTransaction;

     lis_edit:=is_edit;
     lid_period:=id_period;
     LId_Source:=id_source;
     LId_PERIOD:=id_period;
     if is_edit
     then begin
               FormulaDataSet.SelectSQL.Text   :='SELECT * FROM BU_GR_PERIODS_ASIGN_FORMLS_SEL('+IntToStr(ID_PERIOD)+') WHERE ID_RAZD_SOURCE='+IntToStr(id_source);
               FormulaDataSet.Open;
     end;
end;

procedure TFrmFormulaEdit.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var GetInfo:TpFibDataSet;
      Res:Variant;
begin
      res:=null;
      if cxRadioButton1.Checked
      then begin
                Res:=GetRazdStSpr(self, WorkDatabase.Handle, fsNormal, Date, -1, allEnable, cmRazd);

      end
      else begin
                Res:=GetRazdStSpr(self, WorkDatabase.Handle, fsNormal, Date, -1, allEnableProfit, cmSt);
      end;

      if (Res<>NULL)
      then begin
               try
                        GetInfo:=TpFibDataSet.Create(self);
                        GetInfo.Database:=WorkDatabase;
                        GetInfo.Transaction:=ReadTransaction;
                        GetInfo.SelectSQL.Text:='SELECT * FROM PUB_SPR_RAZD_ST WHERE ID_RAZD_ST='+VarToStr(res);
                        GetInfo.Open;
                        if (GetInfo.RecordCount>0)
                        then begin
                                  LId_Source:=GetInfo.FieldByName('ID_RAZD_ST').Value;
                                  SOURCE_RAZD_ST_NUM:=GetInfo.FieldByName('RAZD_ST_NUM').Value;
                                  SOURCE_RAZD_ST_TITLE:=GetInfo.FieldByName('RAZD_ST_TITLE').Value;
                                  cxButtonEdit1.Text:=GetInfo.FieldByName('RAZD_ST_NUM').AsString+' "'+GetInfo.FieldByName('RAZD_ST_TITLE').AsString+'"';

                                  if FormulaDataSet.Active then FormulaDataSet.Close;
                                  FormulaDataSet.SelectSQL.Text   :='SELECT * FROM BU_GR_PERIODS_ASIGN_FORMLS_SEL('+IntToStr(lid_period)+') WHERE ID_RAZD_SOURCE='+IntToStr(LId_Source);
                                  FormulaDataSet.Open;

                        end;
                        GetInfo.Close;
                        GetInfo.Free;
               except
               end;         
      end;
end;

procedure TFrmFormulaEdit.cxButton1Click(Sender: TObject);
begin
     if CheckData
     then ModalResult:=mrYes;
end;

procedure TFrmFormulaEdit.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

function TFrmFormulaEdit.CheckData: Boolean;
var Res:Boolean;
begin
     res:=true;

     if (cxButtonEdit1.Text='') and Res
     then begin
               res:=false;
               ShowMessage('Не вибране джерело');

     end;

     Result:=Res;
end;

procedure TFrmFormulaEdit.ToolButton17Click(Sender: TObject);
  var T:TFrmEditAssTable;
      InsertSp:TpFibStoredProc;
      id:Integer;
begin
     if (cxButtonEdit1.Text<>'')
     then begin
               T:=TFrmEditAssTable.Create(self,WorkDatabase.Handle,0);
               if T.ShowModal=mrYes
               then begin
                         try
                                 InsertSp:=TpFibStoredProc.Create(self);
                                 InsertSp.Database   :=WorkDatabase;
                                 InsertSp.Transaction:=WriteTransaction;
                                 WriteTransaction.StartTransaction;
                                 InsertSp.StoredProcName:='BU_GR_PERIODS_ASIGN_FORMLS_INS';
                                 InsertSp.Prepare;
                                 InsertSp.ParamByName('ID_RAZD_SOURCE').Value     :=Lid_source;
                                 InsertSp.ParamByName('ID_TARGET_OBJ').Value      :=T.ID_TARGET_OBJ;
                                 InsertSp.ParamByName('PERCENT_FROM_SOURCE').Value:=T.cxCalcEdit1.Value;
                                 InsertSp.ParamByName('ID_PERIOD').Value          :=lid_period;
                                 InsertSp.ExecProc;
                                 id:=InsertSp.ParamByName('ID_FORMULA').Value;
                                 WriteTransaction.Commit;
                                 InsertSp.Close;
                                 InsertSp.Free;

                         except on E:Exception do
                                 begin
                                      ShowMessage(e.Message);
                                 end;
                         end;

                         FormulaDataSet.CloseOpen(true);
                         FormulaDataSet.Locate('ID_FORMULA',id,[]);
               end;
               T.Free;
     end
     else begin
               ShowMessage('Не вибрано джерело!');
               cxButtonEdit1.SetFocus;
     end;
end;

procedure TFrmFormulaEdit.ToolButton18Click(Sender: TObject);
var
     InsertStoredProc:TpFibStoredProc;
begin
        if BaseTypes.agMessageDlg('Увага!','Ви хочете видалити запис?',mtWarning,[mbYes,mbNo])=mrYes
        then begin
                  if (FormulaDataSet.RecordCount>0)
                  then begin
                            InsertStoredProc:=TpFibStoredProc.Create(self);
                            InsertStoredProc.Database:=WorkDatabase;
                            InsertStoredProc.Transaction:=WriteTransaction;
                            WriteTransaction.StartTransaction;
                            InsertStoredProc.StoredProcName:='BU_GR_PERIODS_ASIGN_FORMLS_DEL';
                            InsertStoredProc.Prepare;
                            InsertStoredProc.ParamByName('ID_FORMULA').Value:=FormulaDataSet.FieldByName('ID_FORMULA').Value;
                            InsertStoredProc.ExecProc;
                            WriteTransaction.Commit;
                            InsertStoredProc.Free;
                            FormulaDataSet.CacheDelete;
                  end;
        end;
end;

procedure TFrmFormulaEdit.ToolButton19Click(Sender: TObject);
var T:TFrmEditAssTable;
    InsertSp:TpFibStoredProc;
    id:Integer;
begin
     if (FormulaDataSet.RecordCount>0)
     then begin
               T:=TFrmEditAssTable.Create(self, WorkDatabase.Handle, 0);

               T.ID_TARGET_OBJ:=FormulaDataSet.FieldByName('ID_TARGET_OBJ').Value;
               T.TARGET_RAZD_ST_NUM:=FormulaDataSet.FieldByName('TARGET_RAZD_ST_NUM').Value;
               T.TARGET_RAZD_ST_TITLE:=FormulaDataSet.FieldByName('TARGET_RAZD_ST_TITLE').Value;
               T.cxButtonEdit2.Text:=FormulaDataSet.FieldByName('TARGET_RAZD_ST_NUM').Value+' "'+FormulaDataSet.FieldByName('TARGET_RAZD_ST_TITLE').Value+'"';

               T.cxCalcEdit1.Value:=FormulaDataSet.FieldByName('PERCENT_FROM_SOURCE').Value;

               if FormulaDataSet.FieldByName('TYPE_TARGET_OBJ').Value=1
               then T.cxRadioButton3.Checked:=true
               else T.cxRadioButton4.Checked:=true;

               if T.ShowModal=mrYes
               then begin
                         try
                                 InsertSp:=TpFibStoredProc.Create(self);
                                 InsertSp.Database   :=WorkDatabase;
                                 InsertSp.Transaction:=WriteTransaction;
                                 WriteTransaction.StartTransaction;
                                 InsertSp.StoredProcName:='BU_GR_PERIODS_ASIGN_FORMLS_UPD';
                                 InsertSp.Prepare;
                                 InsertSp.ParamByName('ID_RAZD_SOURCE').Value     :=LId_Source;
                                 InsertSp.ParamByName('ID_TARGET_OBJ').Value      :=T.ID_TARGET_OBJ;
                                 InsertSp.ParamByName('PERCENT_FROM_SOURCE').Value:=T.cxCalcEdit1.Value;
                                 InsertSp.ParamByName('ID_PERIOD').Value          :=lid_period;
                                 InsertSp.ParamByName('ID_FORMULA').Value         :=FormulaDataSet.FieldByName('ID_FORMULA').Value;
                                 InsertSp.ExecProc;
                                 id:=FormulaDataSet.FieldByName('ID_FORMULA').Value;
                                 WriteTransaction.Commit;
                                 InsertSp.Close;
                                 InsertSp.Free;

                         except on E:Exception do
                                 begin
                                      ShowMessage(e.Message);
                                 end;
                         end;

                         FormulaDataSet.CloseOpen(true);
                         FormulaDataSet.Locate('ID_FORMULA',id,[]);

               end;
               cxGridDBTableView5.ViewData.Expand(true);
               T.Free;

     end;

end;

end.
