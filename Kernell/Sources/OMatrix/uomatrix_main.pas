unit uomatrix_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Ibase, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  ComCtrls, ToolWin, ImgList, Grids, StdCtrls, ExtCtrls, cxControls,
  cxContainer, cxEdit, cxLabel,pFibStoredProc, Menus, cxCheckBox;

type
  TSchInfo  = record
            ID_SCH:Integer;
            SCH_NUM:String;
            SCH_TITLE:String;
  end;

  TCellInfo= class
  public
           ID_OPER:Integer;
           KR_ID_SCH:Integer;
           DB_ID_SCH:Integer;
           KR_SCH_NUM:String;
           DB_SCH_NUM:String;
           KR_SCH_TITLE:String;
           DB_SCH_TITLE:String;
           KR_CR_OPER:Integer;
           DB_CR_OPER:Integer;
           KR_CR_DOC:Integer;
           DB_CR_DOC:Integer;
           DATE_BEG:TDateTime;
           DATE_End:TDateTime;
  end;


  TfrmOMatrix = class(TForm)
    WorkDatabase: TpFIBDatabase;
    pFIBDataSet1: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StringGrid1: TStringGrid;
    SmallImages: TImageList;
    ToolBar1: TToolBar;
    RefreshButton: TToolButton;
    ToolButton12: TToolButton;
    CloseButton: TToolButton;
    Panel5: TPanel;
    Label1: TLabel;
    cbMonth: TComboBox;
    cbYear: TComboBox;
    Panel1: TPanel;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    Label2: TLabel;
    UpdateButton: TToolButton;
    DeleteButton: TToolButton;
    InsertButton: TToolButton;
    FindButton: TToolButton;
    ToolButton6: TToolButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    cxCheckBox1: TcxCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure FindButtonClick(Sender: TObject);
    procedure cbMonthChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
    SchArray:Array of TSchInfo;
    ActualDate:TDateTime;
    InfinityDate:TDateTime;
    procedure GetData;
    function  UpdateCellViewInfo(ACol,ARow:Integer):String;
    procedure WorkWithCell(CurCol,CurRow:Integer);
    procedure DeleteCell(CurCol,CurRow:Integer);

  public
    { Public declarations }
    constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ActualDate:TDateTime);overload;
  end;

procedure GetOMatrix(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ActualDate:TDateTime);stdcall;
exports GetOMatrix;

implementation



uses GlobalSpr,Resources_unitb, DateUtils, Uomatrix_progress, Uomatrix_edit, Uomatrix_find;

type
TLocObject =class(TCustomGrid)
end;


procedure GetOMatrix(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ActualDate:TDateTime);
var f:Boolean;
    i:Integer;
begin
    f :=true;
    for i:=0 to Application.MainForm.MDIChildCount-1 do
    begin
         if (Application.MainForm.MDIChildren[i] is TfrmOMatrix)
         then begin
                           Application.MainForm.MDIChildren[i].BringToFront;
                           f:=false;
         end;
    end;
    if f then  TfrmOMatrix.Create(AOwner,DB_HANDLE,ActualDate);
end;
{$R *.dfm}

{ TfrmOMatrix }

constructor TfrmOMatrix.Create(AOwner: TComponent;DB_HANDLE: TISC_DB_HANDLE;ActualDate:TDateTime);
var i:Integer;
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DB_HANDLE;
     ReadTransaction.StartTransaction;
     self.ActualDate:= ActualDate;

     cbMonth.Items.Add(TRIM(BU_Month_01));
     cbMonth.Items.Add(TRIM(BU_Month_02));
     cbMonth.Items.Add(TRIM(BU_Month_03));
     cbMonth.Items.Add(TRIM(BU_Month_04));
     cbMonth.Items.Add(TRIM(BU_Month_05));
     cbMonth.Items.Add(TRIM(BU_Month_06));
     cbMonth.Items.Add(TRIM(BU_Month_07));
     cbMonth.Items.Add(TRIM(BU_Month_08));
     cbMonth.Items.Add(TRIM(BU_Month_09));
     cbMonth.Items.Add(TRIM(BU_Month_10));
     cbMonth.Items.Add(TRIM(BU_Month_11));
     cbMonth.Items.Add(TRIM(BU_Month_12));

     for i:=0 to YEARS_COUNT do
     begin
        cbYear.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
     end;

     cbMonth.ItemIndex:=MonthOf(ActualDate)-1;
     for i:=0 to cbYear.Items.Count-1 do
     begin
         if pos(cbYear.Items[i],IntToStr(YearOf(ActualDate)))>0
         then begin
            cbYear.ItemIndex:=i;
            break;
         end;
     end;

     GetData;
end;

procedure TfrmOMatrix.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmOMatrix.CloseButtonClick(Sender: TObject);
begin
     Close;
end;

function TfrmOMatrix.UpdateCellViewInfo(ACol,ARow:Integer):String;
var  KCP,DCP,KCD,DCD:Char;
     ResStr:String;
begin
     if TCellInfo(StringGrid1.Objects[ACol,ARow]).ID_OPER<>-1
     then begin
                          if TCellInfo(StringGrid1.Objects[ACol,ARow]).KR_CR_OPER=1
                          then KCP:='+' else KCP:='-';

                          if TCellInfo(StringGrid1.Objects[ACol,ARow]).DB_CR_OPER=1
                          then DCP:='+' else DCP:='-';

                          if TCellInfo(StringGrid1.Objects[ACol,ARow]).KR_CR_DOC=1
                          then KCD:='+' else KCD:='-';

                          if TCellInfo(StringGrid1.Objects[ACol,ARow]).DB_CR_DOC=1
                          then DCD:='+' else DCD:='-';
                          ResStr:='DB('+DCD+','+DCP+')'+'KR('+KCD+','+KCP+')';
     end
     else ResStr:='';
     Result:=ResStr;

end;


procedure TfrmOMatrix.GetData;
var GetSchInfo:TpFibDataSet;
    CellInfo:TCellInfo;
    i,j:Integer;
    Progress:TfrmOM_Progress;
    GetOperInfoDataSet:TpFibDataSet;
    ExistFlag:Boolean;
begin
     Screen.Cursor:=crHourGlass;

     StringGrid1.ColCount:=2;
     StringGrid1.RowCount:=2;
     StringGrid1.Cells[0,0]:='';
     StringGrid1.Cells[0,1]:='';
     StringGrid1.Cells[1,0]:='';
     StringGrid1.Cells[1,1]:='';

     GetSchInfo:=TpFibDataSet.Create(self);
     GetSchInfo.Database:=WorkDatabase;
     GetSchInfo.Transaction:=ReadTransaction;
     if cxCheckBox1.Checked
     then GetSchInfo.SelectSQL.Text:='SELECT * FROM PUB_SP_MAIN_SCH_SLCT_THRU_OPER('+''''+DateTimeToStr(ActualDate)+''''+',1) WHERE NOT(OPEN_SCH IS NULL) AND SCH_TYPE<=3 AND EXIST_FLAG=1 ORDER BY SCH_NUMBER ASC'
     else GetSchInfo.SelectSQL.Text:='SELECT * FROM PUB_SP_MAIN_SCH_SLCT_THRU_OPER('+''''+DateTimeToStr(ActualDate)+''''+',1) WHERE NOT(OPEN_SCH IS NULL) AND SCH_TYPE<=3 ORDER BY SCH_NUMBER ASC';
     GetSchInfo.Open;
     GetSchInfo.FetchAll;
     StringGrid1.RowCount:=GetSchInfo.RecordCount+1;
     StringGrid1.ColCount:=GetSchInfo.RecordCount+1;

     if SchArray<>nil then SchArray:=nil;
     SetLength(SchArray,GetSchInfo.RecordCount);

     for i:=0 to GetSchInfo.RecordCount-1 do
     begin
          SchArray[i].ID_SCH     :=GetSchInfo.FieldByName('ID_SCH').Value;
          SchArray[i].SCH_NUM    :=GetSchInfo.FieldByName('SCH_NUMBER').Value;
          SchArray[i].SCH_TITLE  :=GetSchInfo.FieldByName('SCH_TITLE').Value;
          GetSchInfo.Next;
     end;

     GetSchInfo.Close;
     GetSchInfo.Free;

     Progress:=TfrmOM_Progress.Create(self);
     Progress.ProgressBar1.Max:=Length(SchArray)*Length(SchArray);
     Progress.ProgressBar1.Step:=Length(SchArray);
     Progress.Show;

     GetOperInfoDataSet:=TpFibDataSet.Create(SElf);
     GetOperInfoDataSet.Database:=WorkDatabase;
     GetOperInfoDataSet.Transaction:=ReadTransaction;
     GetOperInfoDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_MAIN_OPER WHERE DATE_BEG<='+''''+DateTimeToStr(ActualDate)+''''+
                                        '                                 AND DATE_END >'+''''+DateTimeToStr(ActualDate)+'''';
     GetOperInfoDataSet.Open;
     GetOperInfoDataSet.FetchAll;

     for i:=0 to Length(SchArray)-1 do //Db
     begin
          for j:=0 to Length(SchArray)-1 do //Kr
          begin

               CellInfo:=TCellInfo.Create;
               CellInfo.DB_ID_SCH:=SchArray[i].ID_SCH;
               CellInfo.DB_SCH_NUM:=SchArray[i].SCH_NUM;
               CellInfo.DB_SCH_TITLE:=SchArray[i].SCH_TITLE;
               CellInfo.KR_ID_SCH:=SchArray[j].ID_SCH;
               CellInfo.KR_SCH_NUM:=SchArray[j].SCH_NUM;
               CellInfo.KR_SCH_TITLE:=SchArray[j].SCH_TITLE;

               if GetOperInfoDataSet.Locate('OPER_DB_ID_SCH;OPER_KR_ID_SCH',VarArrayOf([SchArray[i].ID_SCH,SchArray[j].ID_SCH]),[])
               then begin
                          CellInfo.ID_OPER:=GetOperInfoDataSet.FieldByName('ID_OPER').AsInteger;
                          CellInfo.DATE_BEG:=GetOperInfoDataSet.FieldByName('DATE_BEG').Value;
                          CellInfo.DATE_END:=GetOperInfoDataSet.FieldByName('DATE_END').Value;
                          if GetOperInfoDataSet.FieldByName('OPER_KR_CR_PROV').AsInteger=1
                          then CellInfo.KR_CR_OPER:=1 else CellInfo.KR_CR_OPER:=0;
                          if GetOperInfoDataSet.FieldByName('OPER_DB_CR_PROV').AsInteger=1
                          then CellInfo.DB_CR_OPER:=1 else CellInfo.DB_CR_OPER:=0;
                          if GetOperInfoDataSet.FieldByName('OPER_KR_CR_DOC').AsInteger=1
                          then CellInfo.KR_CR_DOC:=1  else CellInfo.KR_CR_DOC:=0;
                          if GetOperInfoDataSet.FieldByName('OPER_DB_CR_DOC').AsInteger=1
                          then CellInfo.DB_CR_DOC:=1  else CellInfo.DB_CR_DOC:=0;
                          StringGrid1.Objects[j+1,i+1]:=TObject(CellInfo);
               end
               else begin
                          CellInfo.ID_OPER:=-1;
                          CellInfo.KR_CR_OPER:=-1;
                          CellInfo.KR_CR_DOC:=-1;
                          CellInfo.DB_CR_OPER:=-1;
                          CellInfo.DB_CR_DOC:=-1;
                          StringGrid1.Objects[j+1,i+1]:=TObject(CellInfo);
               end;

               StringGrid1.Cells[j+1,0]  :=SchArray[j].SCH_NUM;
               StringGrid1.Cells[j+1,i+1]:=UpdateCellViewInfo(j+1,i+1);
          end;
          StringGrid1.Cells[0,i+1]:=SchArray[i].SCH_NUM;
          Progress.ProgressBar1.StepIt;
     end;
     Progress.Close;
     Progress.Free;
     Screen.Cursor:=crDefault;
end;

procedure TfrmOMatrix.RefreshButtonClick(Sender: TObject);
var CurDb,CurKr:Integer;
begin
      CurDb:=StringGrid1.Row;
      CurKr:=StringGrid1.Col;
      GetData;
      if (CurKr>0) or (CurDb>0)
      then begin
          if CurKr=0 then CurKr:=1;
          if CurDb=0 then CurDb:=1;
          TLocObject(StringGrid1).FocusCell(CurKr,CurDb,true);
      end;
end;

procedure TfrmOMatrix.StringGrid1DblClick(Sender: TObject);
var i,j:Integer;
begin
     /// X-column
     /// Y-row
     i:=StringGrid1.Selection.TopLeft.X;
     while (i<=StringGrid1.Selection.BottomRight.X) do
     begin
            j:=StringGrid1.Selection.TopLeft.Y;
            While j<=StringGrid1.Selection.BottomRight.Y do
            begin
                  WorkWithCell(i,j);
                  j:=j+1;
            end;
            i:=i+1;
     end;
end;

procedure TfrmOMatrix.FormCreate(Sender: TObject);
var SysInfoDataSet:TpFibDataSet;
begin
    SysInfoDataSet:=TpFibDataSet.Create(self);
    SysInfoDataSet.Database:=WorkDatabase;
    SysInfoDataSet.Transaction:=ReadTransaction;
    SysInfoDataSet.SelectSQL.Text:=' SELECT * FROM PUB_SYS_DATA ';
    SysInfoDataSet.Open;
    InfinityDate:=SysInfoDataSet.FieldByName('INFINITY_DATE').Value;
    SysInfoDataSet.Close;
    SysInfoDataSet.Free;
end;


procedure TfrmOMatrix.InsertButtonClick(Sender: TObject);
begin
     StringGrid1DblClick(self);
end;

procedure TfrmOMatrix.UpdateButtonClick(Sender: TObject);
begin
     StringGrid1DblClick(self);
end;

procedure TfrmOMatrix.DeleteButtonClick(Sender: TObject);
var i,j:Integer;
begin
     /// X-column
     /// Y-row
     if MessageBox(handle,'Вы хотите удалить информацию?','Внимание!',MB_YESNO or MB_ICONQUESTION)=mrYes
     then begin
          i:=StringGrid1.Selection.TopLeft.X;
          while (i<=StringGrid1.Selection.BottomRight.X) do
          begin
                 j:=StringGrid1.Selection.TopLeft.Y;
                 While j<=StringGrid1.Selection.BottomRight.Y do
                 begin
                       DeleteCell(i,j);
                       j:=j+1;
                 end;
                 i:=i+1;
          end;
     end;

end;

procedure TfrmOMatrix.FindButtonClick(Sender: TObject);
var Find: TfrmFind;
    i:Integer;
    FKr,FDb:Integer;
begin
    FKr:=0; FDb:=0;
    Find:=TfrmFind.Create(self);
    if Find.ShowModal=mrYes
    then begin
         if Find.ChKrCoord.Checked and (Find.EdKrCoord.Text<>'')
         then begin
                   for i:=1 to StringGrid1.ColCount do
                   begin
                       if StringGrid1.Cells[i,0]=Find.EdKrCoord.Text
                       then begin
                            FKr:=i;
                            break;
                       end;
                   end;
         end;
         if Find.ChDbCoord.Checked and (Find.EdDbCoord.Text<>'')
         then begin
                   for i:=1 to StringGrid1.ColCount do
                   begin
                       if StringGrid1.Cells[0,i]=Find.EdDbCoord.Text
                       then begin
                            FDb:=i;
                            break;
                       end;
                   end;
         end;
    end;
    Find.Free;

    if (FKr>0) or (FDb>0)
    then begin
          if FKr=0 then FKr:=1;
          if FDb=0 then FDb:=1;
          TLocObject(StringGrid1).FocusCell(FKr,FDb,true);
    end;
end;

procedure TfrmOMatrix.cbMonthChange(Sender: TObject);
begin
     DateSeparator:='.';
     ActualDate:=StrToDate('01.'+IntToStr(cbMonth.ItemIndex+1)+'.'+cbYear.Items[cbYear.ItemIndex]);
end;

procedure TfrmOMatrix.N1Click(Sender: TObject);
begin
     InsertButton.OnClick(self);
end;

procedure TfrmOMatrix.N2Click(Sender: TObject);
begin
     DeleteButton.OnClick(self);
end;

procedure TfrmOMatrix.N3Click(Sender: TObject);
begin
     UpdateButton.OnClick(self);
end;

procedure TfrmOMatrix.N5Click(Sender: TObject);
begin
  FindButton.OnClick(self);
end;

procedure TfrmOMatrix.N6Click(Sender: TObject);
begin
RefreshButton.OnClick(self);
end;

procedure TfrmOMatrix.N8Click(Sender: TObject);
begin
CloseButton.OnClick(self);
end;

procedure TfrmOMatrix.cxCheckBox1PropertiesChange(Sender: TObject);
begin
     RefreshButton.OnClick(self);
end;

procedure TfrmOMatrix.WorkWithCell(CurCol, CurRow: Integer);
var  T:TfrmMatrixEdit;
     InsertStoredProc:TpfibStoredProc;
begin

     T:=TfrmMatrixEdit.Create(self);
     T.EdKrSchNum.Text:=TCellInfo(StringGrid1.Objects[CurCol, CurRow]).KR_SCH_NUM;
     T.EdDBSchNum.Text:=TCellInfo(StringGrid1.Objects[CurCol, CurRow]).DB_SCH_NUM;
     T.EdKrSchTitle.Text:=TCellInfo(StringGrid1.Objects[CurCol, CurRow]).KR_SCH_TITLE;
     T.EdDBSchTitle.Text:=TCellInfo(StringGrid1.Objects[CurCol, CurRow]).DB_SCH_TITLE;
     T.EdKrCrDoc.Checked:=Boolean(TCellInfo(StringGrid1.Objects[CurCol, CurRow]).KR_CR_DOC);
     T.EdDbCrDoc.Checked:=Boolean(TCellInfo(StringGrid1.Objects[CurCol, CurRow]).DB_CR_DOC);
     if Boolean(TCellInfo(StringGrid1.Objects[CurCol, CurRow]).KR_CR_OPER)
     then T.EdCrProv.ItemIndex:=0
     else T.EdCrProv.ItemIndex:=1;
     if T.ShowModal=mrYes
     then begin

            InsertStoredProc:=TpfibStoredProc.Create(self);
            InsertStoredProc.Database:=WorkDatabase;
            InsertStoredProc.Transaction:=WriteTransaction;
            WriteTransaction.StartTransaction;

            if TCellInfo(StringGrid1.Objects[CurCol, CurRow]).ID_OPER=-1
            then begin
                     {Добавление новой операции}
                     InsertStoredProc.StoredProcName:='PUB_SP_MAIN_OPER_INSERT';
                     InsertStoredProc.Prepare;
                     InsertStoredProc.ParamByName('P_DATE_BEG').value         :=ActualDate;
                     InsertStoredProc.ParamByName('P_DATE_END').value         :=InfinityDate;
                     InsertStoredProc.ParamByName('P_OPER_DB_ID_SCH').value   :=TCellInfo(StringGrid1.Objects[CurCol, CurRow]).DB_ID_SCH;
                     InsertStoredProc.ParamByName('P_OPER_KR_ID_SCH').value   :=TCellInfo(StringGrid1.Objects[CurCol, CurRow]).KR_ID_SCH;
                     if T.EdCrProv.ItemIndex=0
                     then begin
                          InsertStoredProc.ParamByName('P_OPER_DB_CR_PROV').value  :=0;
                          InsertStoredProc.ParamByName('P_OPER_KR_CR_PROV').value  :=1;
                     end
                     else begin
                          InsertStoredProc.ParamByName('P_OPER_DB_CR_PROV').value  :=1;
                          InsertStoredProc.ParamByName('P_OPER_KR_CR_PROV').value  :=0;
                     end;
                     InsertStoredProc.ParamByName('P_OPER_DB_CR_DOC').value   :=T.EdDbCrDoc.Checked;
                     InsertStoredProc.ParamByName('P_OPER_KR_CR_DOC').value   :=T.EdKrCrDoc.Checked;
                     InsertStoredProc.ParamByName('P_OPER_COMMENT').value     :='MATRIX INSERT';
                     InsertStoredProc.ExecProc;
                     TCellInfo(StringGrid1.Objects[CurCol, CurRow]).ID_OPER:=InsertStoredProc.ParamByName('P_ID_OPER').Value;
            end
            else begin
                     {Изменение операции}
                     if ActualDate=TCellInfo(StringGrid1.Objects[CurCol, CurRow]).DATE_BEG
                     then begin
                            InsertStoredProc.StoredProcName:='PUB_SP_MAIN_OPER_UPDATE';
                            InsertStoredProc.Prepare;
                            InsertStoredProc.ParamByName('P_ID_OPER').Value          :=TCellInfo(StringGrid1.Objects[CurCol, CurRow]).ID_OPER;
                            InsertStoredProc.ParamByName('P_DATE_BEG').value         :=TCellInfo(StringGrid1.Objects[CurCol, CurRow]).DATE_BEG;
                            InsertStoredProc.ParamByName('P_DATE_END').value         :=InfinityDate;
                            InsertStoredProc.ParamByName('P_OPER_DB_ID_SCH').value   :=TCellInfo(StringGrid1.Objects[CurCol, CurRow]).DB_ID_SCH;
                            InsertStoredProc.ParamByName('P_OPER_KR_ID_SCH').value   :=TCellInfo(StringGrid1.Objects[CurCol, CurRow]).KR_ID_SCH;
                            if T.EdCrProv.ItemIndex=0
                            then begin
                                 InsertStoredProc.ParamByName('P_OPER_DB_CR_PROV').value  :=0;
                                 InsertStoredProc.ParamByName('P_OPER_KR_CR_PROV').value  :=1;
                            end
                            else begin
                                 InsertStoredProc.ParamByName('P_OPER_DB_CR_PROV').value  :=1;
                                 InsertStoredProc.ParamByName('P_OPER_KR_CR_PROV').value  :=0;
                            end;
                            InsertStoredProc.ParamByName('P_OPER_DB_CR_DOC').value   :=T.EdDbCrDoc.Checked;
                            InsertStoredProc.ParamByName('P_OPER_KR_CR_DOC').value   :=T.EdKrCrDoc.Checked;
                            InsertStoredProc.ParamByName('P_OPER_COMMENT').Value:='MATRIX EDIT';
                            InsertStoredProc.ExecProc;
                     end
                     else begin
                            InsertStoredProc.StoredProcName:='PUB_SP_MAIN_OPER_UPDATE_EX';
                            InsertStoredProc.Prepare;
                            InsertStoredProc.ParamByName('P_ID_OPER').Value          :=TCellInfo(StringGrid1.Objects[CurCol, CurRow]).ID_OPER;
                            InsertStoredProc.ParamByName('P_DATE_BEG').value         :=TCellInfo(StringGrid1.Objects[CurCol, CurRow]).DATE_END;
                            InsertStoredProc.ParamByName('P_DATE_END').value         :=ActualDate-1;
                            InsertStoredProc.ParamByName('P_OPER_DB_ID_SCH').value   :=TCellInfo(StringGrid1.Objects[CurCol, CurRow]).DB_ID_SCH;
                            InsertStoredProc.ParamByName('P_OPER_KR_ID_SCH').value   :=TCellInfo(StringGrid1.Objects[CurCol, CurRow]).KR_ID_SCH;
                            InsertStoredProc.ParamByName('P_OPER_DB_CR_PROV').value  :=TCellInfo(StringGrid1.Objects[CurCol, CurRow]).DB_CR_OPER;
                            InsertStoredProc.ParamByName('P_OPER_KR_CR_PROV').value  :=TCellInfo(StringGrid1.Objects[CurCol, CurRow]).KR_CR_OPER;
                            InsertStoredProc.ParamByName('P_OPER_DB_CR_DOC').value   :=TCellInfo(StringGrid1.Objects[CurCol, CurRow]).DB_CR_DOC;
                            InsertStoredProc.ParamByName('P_OPER_KR_CR_DOC').value   :=TCellInfo(StringGrid1.Objects[CurCol, CurRow]).KR_CR_DOC;
                            InsertStoredProc.ParamByName('P_OPER_COMMENT').Value     :='MATRIX EDIT';
                            InsertStoredProc.ExecProc;

                            InsertStoredProc.StoredProcName:='PUB_SP_MAIN_OPER_INSERT_WITH_ID';
                            InsertStoredProc.Prepare;
                            InsertStoredProc.ParamByName('P_ID_OPER').Value          :=TCellInfo(StringGrid1.Objects[CurCol, CurRow]).ID_OPER;
                            InsertStoredProc.ParamByName('P_DATE_BEG').value         :=ActualDate;
                            InsertStoredProc.ParamByName('P_DATE_END').value         :=InfinityDate;
                            InsertStoredProc.ParamByName('P_OPER_DB_ID_SCH').value   :=TCellInfo(StringGrid1.Objects[CurCol, CurRow]).DB_ID_SCH;
                            InsertStoredProc.ParamByName('P_OPER_KR_ID_SCH').value   :=TCellInfo(StringGrid1.Objects[CurCol, CurRow]).KR_ID_SCH;
                            if T.EdCrProv.ItemIndex=0
                            then begin
                                 InsertStoredProc.ParamByName('P_OPER_DB_CR_PROV').value  :=0;
                                 InsertStoredProc.ParamByName('P_OPER_KR_CR_PROV').value  :=1;
                            end
                            else begin
                                 InsertStoredProc.ParamByName('P_OPER_DB_CR_PROV').value  :=1;
                                 InsertStoredProc.ParamByName('P_OPER_KR_CR_PROV').value  :=0;
                            end;
                            InsertStoredProc.ParamByName('P_OPER_DB_CR_DOC').value        :=T.EdDbCrDoc.Checked;
                            InsertStoredProc.ParamByName('P_OPER_KR_CR_DOC').value        :=T.EdKrCrDoc.Checked;
                            InsertStoredProc.ParamByName('P_OPER_COMMENT').Value          :='MATRIX EDIT';
                            InsertStoredProc.ExecProc;
                     end;
            end;

            WriteTransaction.commit;
            InsertStoredProc.Free;
            {Сохранение информации о прводке в буффер}
            TCellInfo(StringGrid1.Objects[CurCol, CurRow]).DATE_BEG:=ActualDate;
            TCellInfo(StringGrid1.Objects[CurCol, CurRow]).DATE_END:=InfinityDate;

            if T.EdCrProv.ItemIndex=0
            then begin
                 TCellInfo(StringGrid1.Objects[CurCol, CurRow]).KR_CR_OPER:=1;
                 TCellInfo(StringGrid1.Objects[CurCol, CurRow]).DB_CR_OPER:=0;
            end
            else begin
                 TCellInfo(StringGrid1.Objects[CurCol, CurRow]).KR_CR_OPER:=0;
                 TCellInfo(StringGrid1.Objects[CurCol, CurRow]).DB_CR_OPER:=1;
            end;

            if T.EdKrCrDoc.Checked
            then TCellInfo(StringGrid1.Objects[CurCol, CurRow]).KR_CR_DOC:=1  else TCellInfo(StringGrid1.Objects[CurCol, CurRow]).KR_CR_DOC:=0;
            if T.EdDBCrDoc.Checked
            then TCellInfo(StringGrid1.Objects[CurCol, CurRow]).DB_CR_DOC:=1  else TCellInfo(StringGrid1.Objects[CurCol, CurRow]).DB_CR_DOC:=0;

            {Отображение информации о проводке}
            StringGrid1.Cells[CurCol, CurRow]:=UpdateCellViewInfo(CurCol, CurRow);

     end;
     T.Free;
end;

procedure TfrmOMatrix.DeleteCell(CurCol, CurRow: Integer);
var DeleteStoredProc:TpFibStoredProc;
begin
     if StringGrid1.Objects[CurCol, CurRow]<>nil
     then begin
          IF TCellInfo(StringGrid1.Objects[CurCol, CurRow]).ID_OPER<>-1
          then begin
                               DeleteStoredProc:=TpfibStoredProc.Create(self);
                               DeleteStoredProc.Database:=WorkDatabase;
                               DeleteStoredProc.Transaction:=WriteTransaction;
                               WriteTransaction.StartTransaction;
                               DeleteStoredProc.StoredProcName:='PUB_SP_MAIN_OPER_DELETE';
                               DeleteStoredProc.Prepare;
                               DeleteStoredProc.ParamByName('P_ID_OPER').value          :=TCellInfo(StringGrid1.Objects[CurCol, CurRow]).ID_OPER;
                               DeleteStoredProc.ParamByName('P_DATE_END').value         :=ActualDate-1;
                               DeleteStoredProc.ExecProc;
                               WriteTransaction.Commit;

                               TCellInfo(StringGrid1.Objects[CurCol, CurRow]).ID_OPER:=-1;
                               TCellInfo(StringGrid1.Objects[CurCol, CurRow]).KR_CR_OPER:=-1;
                               TCellInfo(StringGrid1.Objects[CurCol, CurRow]).KR_CR_DOC:=-1;
                               TCellInfo(StringGrid1.Objects[CurCol, CurRow]).DB_CR_OPER:=-1;
                               TCellInfo(StringGrid1.Objects[CurCol, CurRow]).DB_CR_DOC:=-1;
                               StringGrid1.Cells[CurCol, CurRow]:=UpdateCellViewInfo(CurCol, CurRow);
          end;
    end;
end;

end.
