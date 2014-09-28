unit uSchProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, DB, FIBDataSet, pFIBDataSet,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,Resources_unitb,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, FIBDatabase, pFIBDatabase,  pFIBStoredProc, DateUtils,
  ComCtrls, ToolWin,Ibase, ImgList,GlobalSpr,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit,  cxDBLookupComboBox, FIBQuery, pFIBQuery, cxMemo,
  cxDBEdit, cxCheckBox;

type


TfrmEditProperties = class(TForm)
    PropDataSet: TpFIBDataSet;
    PropDataSource: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    columnst: TcxStyle;
    WorkDatabase: TpFIBDatabase;
    Images: TImageList;
    cxStyle2: TcxStyle;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    cxStyle3: TcxStyle;
    Panel1: TPanel;
    Label8: TLabel;
    cbMonth: TComboBox;
    cbYear: TComboBox;
    CheckBox1: TCheckBox;
    ToolBar1: TToolBar;
    SetButton: TToolButton;
    UnSetButton: TToolButton;
    ToolButton3: TToolButton;
    AnalizeButton: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    cxCheckBox1: TcxCheckBox;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    BalckStyle: TcxStyle;
    GreenStyle: TcxStyle;
    RedStyle: TcxStyle;
    BlueStyle: TcxStyle;
    PurpleStyle: TcxStyle;
    AquaStyle: TcxStyle;
    SkyBlueStyle: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbMonthChange(Sender: TObject);
    procedure SetButtonClick(Sender: TObject);
    procedure UnSetButtonClick(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure AnalizeButtonClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cxGrid1DBTableView1DBColumn5GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cxGrid1DBTableView1DBColumn6GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure cxGrid1DBTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
  private
    { Private declarations }
  public
    GConnection:TConfigConnStructure;
    Curr_data:TdateTime;
    UseDate:TDateTime;
    Sch_Title:string;
    Sch_Number:string;
    Curr_Id_Sch   :Int64;
    Curr_Id_Oper  :Int64;
    Curr_Id_RzdSt :Int64;
    Curr_Id_Kekv  :Int64;
    Curr_id_smeta :Int64;
    Curr_id_vidopl:Int64;

    KR_NUM    : string;
    DB_NUM    : string;
    KR_TITLE  : string;
    DB_TITLE  : string;
    KEKV_TITLE:string;
    KEKV_CODE :string;
    RAZD_NUM  :string;
    RAZD_TITLE:string;
    PROF_TEXT :string;
    SM_TITLE  :string;
    SM_KOD    :string;
    VO_TITLE  :string;
    VO_KOD    :string;

    CurPT:TPropType;
    procedure SetCurrentDateInformation;
    procedure GetCurrentDBaseInformation;
    procedure GetCurrSchDBInfo;
    procedure GetCurrOperDBInfo;
    procedure GetCurrKekvDBInfo;
    procedure GetCurrRazdStDBInfo;
    procedure GetCurrSMDbInfo;
    procedure GetCurrVidOplInfo;
    constructor Create(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;         Id_Object:Integer; Curr_Date:TdateTime; PT:TPropType);overload;

    { Public declarations }
end;


   function GetSprMdi  (AOwner:TComponent; DBHandle:TISC_DB_HANDLE;         Id_Object:Integer; Curr_Date:TdateTime; PT:TPropType):Integer;stdcall;
   exports GetSprMdi;

implementation

uses BaseTypes;
{$R *.dfm}

function GetSprMdi  (AOwner:TComponent; DBHandle:TISC_DB_HANDLE;         Id_Object:Integer; Curr_Date:TdateTime; PT:TPropType):Integer;
begin
         GetSprMdi:=integer(TfrmEditProperties.Create(AOwner,DBHandle,Id_Object,Curr_Date,PT));
end;


constructor TfrmEditProperties.Create(AOwner: TComponent; DBHandle:TISC_DB_HANDLE; Id_Object:Integer; Curr_Date:TdateTime; PT:TPropType);
var I:Integer;
    Curr_data_tmp:TDateTime;
begin
      inherited Create(AOwner);
      WorkDatabase.Handle:=DBHandle;
      Curr_data_tmp:=Curr_Date;
      self.Curr_data:=EncodeDate(YearOf(Curr_Data_tmp), MonthOf(Curr_Data_tmp),1);

      CurPT:=PT;

      case CurPT of
            ptSch:     Curr_Id_Sch   :=Id_Object;
            ptOper:    Curr_Id_Oper  :=Id_Object;
            ptRazdSt:  Curr_Id_RzdSt :=Id_Object;
            ptKekv:    Curr_Id_Kekv  :=Id_Object;
            ptSmeta:   Curr_id_smeta :=Id_Object;
            ptVidOpl:  begin
                            Curr_id_vidopl:=Id_Object;
                            cxStyle1.Color:=clSkyBlue;
                            GreenStyle.Color:=clSkyBlue;
                            BalckStyle.Color:=clSkyBlue;
                            BlueStyle.Color:=clSkyBlue;
                            RedStyle.Color:=clSkyBlue;
                            AquaStyle.Color:=clSkyBlue;
                            PurpleStyle.Color:=clSkyBlue;
                            SkyBlueStyle.Color:=clSkyBlue;

                            for i:=0 to cxStyleRepository1.Count-1 do
                            begin
                                 TcxStyle(cxStyleRepository1.Items[i]).Font.Size:=8;
                            end;
                       end;
      end;

end;


procedure TfrmEditProperties.FormCreate(Sender: TObject);
begin
      label8.Caption:=PUB_STATE_ON_DATE_CONST;
      CheckBox1.Caption:=PUB_GROUP_CONST;
      cxGrid1DBTableView1DBColumn1.Caption:=PUB_COLTITL_PR_NUM;
      cxGrid1DBTableView1DBColumn2.Caption:=PUB_COLTITL_PR_TIT;
      cxGrid1DBTableView1DBColumn3.Caption:=PUB_COLTITL_PR_VAL;
      cxGrid1DBTableView1DBColumn4.Caption:=PUB_COLTITL_PR_GRP;
      cxGrid1DBTableView1DBColumn5.Caption:=PUB_COLTITL_DATE_BEG;
      cxGrid1DBTableView1DBColumn6.Caption:=PUB_COLTITL_DATE_END;
      SetButton.Caption:=PUB_ACTION_SET_CONST;
      UnSetButton.Caption:=PUB_ACTION_DELETE_CONST;
      AnalizeButton.Caption:=PUB_ACTION_ANALIZE_CONST;


      case CurPT of
            ptSch:     GetCurrSchDBInfo;
            ptOper:    GetCurrOperDBInfo;
            ptRazdSt:  GetCurrRazdStDBInfo;
            ptKekv:    GetCurrKekvDBInfo;
            ptSmeta:   GetCurrSMDbInfo;
            ptVidOpl:  GetCurrVidOplInfo;
      end;


     GetCurrentDBaseInformation;
     SetCurrentDateInformation;

end;

procedure TfrmEditProperties.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmEditProperties.cbMonthChange(Sender: TObject);
var date_str:string;
begin
     PropDataSet.Close;
     DateSeparator:='.';
     Curr_data:=StrToDate('01.'+IntToStr(cbMonth.ItemIndex+1)+'.'+cbYear.Items[cbYear.ItemIndex]);
     DateTimeToString(date_str,'dd.mm.yyyy',Curr_data);

     GetCurrentDBaseInformation;

     case CurPT of
            ptSch:     begin
                              caption:=BU_PROP_BY_SCH+' : "'+Sch_Title+' '+Sch_Number+'" на '+date_str;
                       end;
            ptOper:    begin
                              Caption:=BU_PROP_BY_OPER+' '+BU_DEBET+': "'+
                              DB_NUM+' '+
                              DB_TITLE+'" - '+BU_DEBET+': "'+
                              KR_NUM+' '+
                              KR_TITLE+'" на '+date_str;
                       end;
            ptRazdSt:  begin
                              Caption:=BU_PROP_BY_RZST+': '+ RAZD_NUM+' '+'"'+
                              RAZD_TITLE+'"('+PROF_TEXT+')'+'на '+date_str;
                       end;
            ptKekv:    begin
                              Caption:=BU_PROP_BY_KEKV+': '+ KEKV_CODE+' '+'"'+
                              KEKV_TITLE+'" на '+date_str;
                       end;
            ptSmeta:   begin
                              Caption:=BU_PROP_BY_SMETA+': '+ SM_KOD+' '+'"'+
                              SM_TITLE+'" на '+date_str;
                       end;

            ptVidOpl:  begin
                              Caption:='Властивості виду оплат '+': '+ VO_KOD+' '+'"'+
                              VO_TITLE+'" на '+DateToStr(Curr_data);
                       end;
      end;

      cxGrid1DBTableView1.ViewData.Expand(true);
end;

procedure TfrmEditProperties.SetCurrentDateInformation;
var i:Integer;
begin
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
          cbYear.Items.Add(TRIM(IntToStr(1996+i)));
       end;


       cbMonth.ItemIndex:=MonthOf(Curr_data)-1;
       for i:=0 to cbYear.Items.Count-1 do
       begin
           if pos(cbYear.Items[i],IntToStr(YearOf(Curr_data)))>0
           then begin
              cbYear.ItemIndex:=i;
              break;
           end;
       end;

end;

procedure TfrmEditProperties.GetCurrentDBaseInformation;
var date_str, use_str:string;
    id_prop:Integer;
begin
       id_prop:=0;
       dateTimetostring(date_str,'dd.mm.yyyy', Curr_data);
       dateTimetostring(use_str,'dd.mm.yyyy', UseDate);

       PropDataSet.Database:=WorkDatabase;
       PropDataSet.Transaction:=ReadTransaction;
       if PropDataSet.Active
       then begin
            if PropDataSet.RecordCount>0
            then id_prop:=PropDataSet.FieldByName('ID_PROP').Value;
            PropDataSet.Close;
       end;

       case CurPT of
              ptSch:     begin
                              PropDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_CUR_PROP_UNDER_SCH_SELECT('+
                              ''''+date_str+''''+','+
                              IntToStr(Curr_Id_Sch)+',1)';
                         end;
              ptOper:    begin
                              PropDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_CUR_PROP_UNDER_SCH_SELECT('+
                              ''''+date_str+''''+','+
                              IntToStr(Curr_Id_Oper)+',2)';
                         end;
              ptRazdSt:  begin
                              PropDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_CUR_PROP_UNDER_SCH_SELECT('+
                              ''''+date_str+''''+','+
                              IntToStr(Curr_Id_RzdSt)+',3)';
                         end;
              ptKekv:    begin
                              PropDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_CUR_PROP_UNDER_SCH_SELECT('+
                              ''''+date_str+''''+','+
                              IntToStr(Curr_Id_Kekv)+',4)';
                         end;
              ptSmeta:   begin
                              PropDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_CUR_PROP_UNDER_SCH_SELECT('+
                              ''''+date_str+''''+','+
                              IntToStr(Curr_id_smeta)+',5)';
                         end;
              ptVidOpl:  begin
                              PropDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_CUR_PROP_UNDER_SCH_SELECT('+
                              ''''+date_str+''''+','+
                              IntToStr(Curr_id_vidopl)+',6)';
                         end;
                         else begin
                              PropDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_CUR_PROP_UNDER_SCH_SELECT('+
                              ''''+date_str+''''+','+
                              IntToStr(Curr_id_vidopl)+',-1)';
                         end;
        end;

       PropDataSet.Open;
       PropDataSet.FetchAll;
       cxGrid1DBTableView1.DataController.LocateByKey(id_prop);
end;

procedure TfrmEditProperties.GetCurrSchDBInfo;
var date_str, use_str:string;
    temp_dataset:TpFibDataSet;
begin
       dateTimetostring(date_str,'dd.mm.yyyy', Curr_data);
       dateTimetostring(use_str,'dd.mm.yyyy', UseDate);
       temp_dataset:=TpFibDataSet.Create(self);
       temp_dataset.Database:=WorkDatabase;
       temp_dataset.Transaction:=ReadTransaction;

       temp_dataset.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SP_MAIN_SCH_SELECT('+''''+date_str+''''+','+IntToStr(DEFAULT_ROOT_ID)+')'+
                                         ' WHERE ID_SCH='+IntToStr(Curr_Id_Sch);
       temp_dataset.Open;
       temp_dataset.FetchAll;
       if temp_dataset.RecordCount>0
       then begin
          caption:=BU_PROP_BY_SCH+': "'+temp_dataset.FieldByName('SCH_TITLE').AsString+' '+temp_dataset.FieldByName('SCH_NUMBER').AsString+'" на '+date_str;
          Sch_Title:=temp_dataset.FieldByName('SCH_TITLE').AsString;
          Sch_Number:=temp_dataset.FieldByName('SCH_NUMBER').AsString;
       end;
       temp_dataset.Free;

end;

procedure TfrmEditProperties.GetCurrOperDBInfo;
var date_str, use_str:string;
    temp_dataset:TpFibDataSet;
begin
       dateTimetostring(date_str,'dd.mm.yyyy', Curr_data);
       dateTimetostring(use_str,'dd.mm.yyyy', UseDate);
       temp_dataset:=TpFibDataSet.Create(self);
       temp_dataset.Database:=WorkDatabase;
       temp_dataset.Transaction:=ReadTransaction;

       try
                 temp_dataset.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SP_MAIN_OPER_SELECT_EX('+''''+date_str+''''+','+IntToStr(Curr_Id_Oper)+')';

                 temp_dataset.Open;
                 temp_dataset.FetchAll;
                 if temp_dataset.RecordCount>0
                 then begin
                              KR_NUM:=Trim(temp_dataset.FieldByName('OPER_KR_SCH_NUMBER').AsString);
                              DB_NUM:=Trim(temp_dataset.FieldByName('OPER_DB_SCH_NUMBER').AsString);
                              KR_TITLE:=Trim(temp_dataset.FieldByName('OPER_KR_SCH_TITLE').AsString);
                              DB_TITLE:=Trim(temp_dataset.FieldByName('OPER_DB_SCH_TITLE').AsString);

                              Caption:=BU_PROP_BY_OPER+' '+BU_DEBET+': "'+
                              DB_NUM+' '+
                              DB_TITLE+'" - '+BU_DEBET+': "'+
                              KR_NUM+' '+
                              KR_TITLE+'" на '+date_str;

                 end;
                 temp_dataset.Free;
       except on E:Exception do
                 begin
                   ShowMessage(E.Message);
                 end;
       end;

end;

procedure TfrmEditProperties.SetButtonClick(Sender: TObject);
var Proc:TpFibStoredProc;
    WorkItem:Integer;
begin
if  PropDataSet.FieldByName('CHECKED').AsInteger=0
then begin

                try
                  WorkItem:=PropDataSet.FieldByName('ID_PROP').AsInteger;
                  Proc:=TpFibStoredProc.Create(self);
                  Proc.Database:=WorkDatabase;
                  Proc.Transaction:=WriteTransaction;
                  WriteTransaction.StartTransaction;
                  Proc.StoredProcName:='PUB_DT_SCH_PROP_SET';
                  Proc.Prepare;
                  Proc.ParamByName('P_ID_PROP').Value:=PropDataSet.FieldByName('ID_PROP').AsInteger;

                 case CurPT of
                        ptSch:     begin
                                    Proc.ParamByName('P_ID_OBJ').asInt64:=Curr_Id_Sch;
                                    Proc.ParamByName('P_TYPE_PROP').Value:=1;
                                   end;
                        ptOper:    begin
                                    Proc.ParamByName('P_ID_OBJ').asInt64:=Curr_Id_Oper;
                                    Proc.ParamByName('P_TYPE_PROP').Value:=2;
                                   end;
                        ptRazdSt:  begin
                                    Proc.ParamByName('P_ID_OBJ').AsInt64:=Curr_Id_RzdSt;
                                    Proc.ParamByName('P_TYPE_PROP').Value:=3;
                                   end;
                        ptKekv:    begin
                                    Proc.ParamByName('P_ID_OBJ').AsInt64:=Curr_Id_Kekv;
                                    Proc.ParamByName('P_TYPE_PROP').Value:=4;
                                   end;
                        ptSmeta:   begin
                                    Proc.ParamByName('P_ID_OBJ').AsInt64:=Curr_id_smeta;
                                    Proc.ParamByName('P_TYPE_PROP').Value:=5;
                                   end;
                        ptVidOpl:  begin
                                    Proc.ParamByName('P_ID_OBJ').AsInt64:=Curr_id_vidopl;
                                    Proc.ParamByName('P_TYPE_PROP').Value:=6;
                                   end;
                  end;

                  Proc.ParamByName('P_DATE_BEG').Value:=Curr_data;

                  Proc.ExecProc;
                  WriteTransaction.Commit;

                  cxGrid1.BeginUpdate;
                  PropDataSet.CloseOpen(true);

                  case CurPT of
                               ptSch:   PropDataSet.Locate('id_sch;id_prop',VarArrayOf([Curr_Id_Sch,   WorkItem]),[]);
                               ptOper:  PropDataSet.Locate('id_sch;id_prop',VarArrayOf([Curr_Id_Oper,  WorkItem]),[]);
                               ptRazdSt:PropDataSet.Locate('id_sch;id_prop',VarArrayOf([Curr_Id_RzdSt, WorkItem]),[]);
                               ptKekv:  PropDataSet.Locate('id_sch;id_prop',VarArrayOf([Curr_Id_Kekv,  WorkItem]),[]);
                               ptSmeta: PropDataSet.Locate('id_sch;id_prop',VarArrayOf([Curr_id_smeta, WorkItem]),[]);
                               ptVidOpl:PropDataSet.Locate('id_sch;id_prop',VarArrayOf([Curr_id_vidopl,WorkItem]),[]);
                  end;



                  cxGrid1.EndUpdate;


                except on E:Exception do
                  begin
                       WriteTransaction.Rollback;
                  end;
                end;
  end;
end;

procedure TfrmEditProperties.UnSetButtonClick(Sender: TObject);
var Proc:TpFibStoredProc;
    WorkItem:Integer;
begin
      if  PropDataSet.FieldByName('CHECKED').AsInteger=1
      then begin
                if BaseTypes.agMessageDlg(BU_WarningCaption,BU_DeleteConfirmation,mtWarning,[mbYes, mbNo])=mrYes
                then begin
                         try
                                    WorkItem:=PropDataSet.FieldByName('ID_PROP').AsInteger;
                                    Proc:=TpFibStoredProc.Create(self);
                                    Proc.Database:=WorkDatabase;
                                    Proc.Transaction:=WriteTransaction;
                                    WriteTransaction.StartTransaction;
                                    Proc.StoredProcName:='PUB_DT_SCH_PROP_DEL';
                                    Proc.Prepare;
                                    Proc.ParamByName('P_ID_PROP').Value:=PropDataSet.FieldByName('ID_PROP').AsInteger;
                                    case CurPT of
                                          ptSch:     begin
                                                      Proc.ParamByName('P_ID_SCH').asInt64:=Curr_Id_Sch;
                                                     end;
                                          ptOper:    begin
                                                      Proc.ParamByName('P_ID_SCH').asInt64:=Curr_Id_Oper;
                                                     end;
                                          ptRazdSt:  begin
                                                      Proc.ParamByName('P_ID_SCH').asInt64:=Curr_Id_RzdSt;
                                                     end;
                                          ptKekv:    begin
                                                      Proc.ParamByName('P_ID_SCH').asInt64:=Curr_Id_Kekv;
                                                     end;
                                          ptSmeta:   begin
                                                      Proc.ParamByName('P_ID_SCH').asInt64:=Curr_id_smeta;
                                                     end;
                                          ptVidOpl:  begin
                                                      Proc.ParamByName('P_ID_SCH').asInt64:=Curr_id_vidopl;
                                                     end;
                                    end;
                                    Proc.ParamByName('P_CURR_DATE').Value:=Curr_data;
                                    Proc.ParamByName('P_USE_END').Value:=Curr_data-1;
                                    Proc.ExecProc;
                                    WriteTransaction.Commit;
                                    PropDataSet.CloseOpen(true);
                                    case CurPT of
                                                 ptSch:   PropDataSet.Locate('id_sch;id_prop',VarArrayOf([Curr_Id_Sch,   WorkItem]),[]);
                                                 ptOper:  PropDataSet.Locate('id_sch;id_prop',VarArrayOf([Curr_Id_Oper,  WorkItem]),[]);
                                                 ptRazdSt:PropDataSet.Locate('id_sch;id_prop',VarArrayOf([Curr_Id_RzdSt, WorkItem]),[]);
                                                 ptKekv:  PropDataSet.Locate('id_sch;id_prop',VarArrayOf([Curr_Id_Kekv,  WorkItem]),[]);
                                                 ptSmeta: PropDataSet.Locate('id_sch;id_prop',VarArrayOf([Curr_id_smeta, WorkItem]),[]);
                                                 ptVidOpl: PropDataSet.Locate('id_sch;id_prop',VarArrayOf([Curr_id_vidopl,WorkItem]),[]);
                                    end;                          except on E:Exception do
                                    begin
                                         WriteTransaction.Rollback;
                                    end;
                          end;
                   end;
      end
      else begin
                MessageBox(Handle,PChar(BU_PropDelError),PChar(BU_WarningCaption),MB_OK or MB_ICONWARNING);
      end;
end;

procedure TfrmEditProperties.ToolButton9Click(Sender: TObject);
begin
     cxGrid1DBTableView1.Filtering.RunCustomizeDialog(nil);
end;

procedure TfrmEditProperties.AnalizeButtonClick(Sender: TObject);
begin
     case CurPT of
            ptSch:     begin
                             GetAnalize(self.Owner,WorkDatabase.handle,Curr_data, Curr_Id_Sch,  vmFixSch, fsMdiChild);
                       end;
            ptOper:    begin
                             ShowMessage(PUB_UNDER_CONSTRUCTION_CONST);
                       end;
            ptRazdSt:  begin
                             ShowMessage(PUB_UNDER_CONSTRUCTION_CONST);
                       end;
            ptKekv:    begin
                             ShowMessage(PUB_UNDER_CONSTRUCTION_CONST);
                       end;
            ptSmeta:   begin
                             ShowMessage(PUB_UNDER_CONSTRUCTION_CONST);
                       end;
            ptVidOpl:  begin
                             ShowMessage(PUB_UNDER_CONSTRUCTION_CONST);
                       end;
      end;

end;

procedure TfrmEditProperties.GetCurrKekvDBInfo;
var date_str, use_str:string;
    temp_dataset:TpFibDataSet;
begin
       dateTimetostring(date_str,'dd.mm.yyyy', Curr_data);
       dateTimetostring(use_str,'dd.mm.yyyy', UseDate);
       temp_dataset:=TpFibDataSet.Create(self);
       temp_dataset.Database:=WorkDatabase;
       temp_dataset.Transaction:=ReadTransaction;

       try
                 temp_dataset.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SP_KEKV_SELECT('+''''+date_str+''''+','+IntToStr(DEFAULT_ROOT_ID)+') WHERE ID_KEKV='+IntToStr(Curr_Id_Kekv);
                 temp_dataset.Open;
                 temp_dataset.FetchAll;
                 if temp_dataset.RecordCount>0
                 then begin
                              KEKV_TITLE:=temp_dataset.FieldByName('KEKV_TITLE').AsString;
                              KEKV_CODE :=temp_dataset.FieldByName('KEKV_CODE').AsString;

                              Caption:=BU_PROP_BY_KEKV+': '+ KEKV_CODE+' '+'"'+
                              KEKV_TITLE+'" на '+date_str;

                 end;
                 temp_dataset.Free;
       except on E:Exception do
                 begin
                   ShowMessage(E.Message);
                 end;
       end;

end;

procedure TfrmEditProperties.GetCurrRazdStDBInfo;
var date_str, use_str:string;
    temp_dataset:TpFibDataSet;
begin
       dateTimetostring(date_str,'dd.mm.yyyy', Curr_data);
       dateTimetostring(use_str,'dd.mm.yyyy', UseDate);
       temp_dataset:=TpFibDataSet.Create(self);
       temp_dataset.Database:=WorkDatabase;
       temp_dataset.Transaction:=ReadTransaction;
       try
                 temp_dataset.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RAZD_ST_SELECT('+IntToStr(0)+') WHERE ID_RAZD_ST='+IntToStr(Curr_Id_RzdSt);
                 temp_dataset.Open;
                 temp_dataset.FetchAll;
                 if temp_dataset.RecordCount>0
                 then begin
                              RAZD_NUM  :=temp_dataset.FieldByName('RAZD_ST_NUM').AsString;
                              RAZD_TITLE:=temp_dataset.FieldByName('RAZD_ST_TITLE').AsString;
                              PROF_TEXT :=temp_dataset.FieldByName('OBJ_TITLE').AsString;

                              Caption:=BU_PROP_BY_RZST+': '+ RAZD_NUM+' '+'"'+
                              RAZD_TITLE+'"('+PROF_TEXT+')'+'на '+date_str;
                 end;
                 temp_dataset.Free;
       except on E:Exception do
                 begin
                   ShowMessage(E.Message);
                 end;
       end;

end;

procedure TfrmEditProperties.CheckBox1Click(Sender: TObject);
begin
    cxGrid1DBTableView1.OptionsView.GroupByBox:=CheckBox1.Checked;
end;

procedure TfrmEditProperties.GetCurrSMDbInfo;
var date_str, use_str:string;
    temp_dataset:TpFibDataSet;
begin
       dateTimetostring(date_str,'dd.mm.yyyy', Curr_data);
       dateTimetostring(use_str,'dd.mm.yyyy', UseDate);
       temp_dataset:=TpFibDataSet.Create(self);
       temp_dataset.Database:=WorkDatabase;
       temp_dataset.Transaction:=ReadTransaction;
       try
                 temp_dataset.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_SMETA_SELECT('+''''+date_str+''''+',0) WHERE P_ID_SMETA='+IntToStr(Curr_id_smeta);
                 temp_dataset.Open;
                 temp_dataset.FetchAll;
                 if temp_dataset.RecordCount>0
                 then begin
                              SM_KOD  :=temp_dataset.FieldByName('P_SMETA_KOD').AsString;
                              SM_TITLE:=temp_dataset.FieldByName('P_SMETA_TITLE').AsString;


                              Caption:=BU_PROP_BY_SMETA+': '+ SM_KOD+' '+'"'+
                              SM_TITLE+'" на '+date_str;
                 end;
                 temp_dataset.Free;
       except on E:Exception do
                 begin
                   ShowMessage(E.Message);
                 end;
       end;
end;


procedure TfrmEditProperties.cxCheckBox1PropertiesChange(Sender: TObject);
begin
     cxGrid1DBTableView1.OptionsView.GroupByBox:=cxCheckBox1.Checked;
end;

procedure TfrmEditProperties.cxGrid1DBTableView1DBColumn5GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
    if (ARecord.Values[4]=NULL)
    then AText:='*';
end;

procedure TfrmEditProperties.cxGrid1DBTableView1DBColumn6GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
    if (ARecord.Values[5]=NULL)
    then AText:='*';
end;

procedure TfrmEditProperties.ToolButton1Click(Sender: TObject);
begin
     GetCurrentDBaseInformation;
end;

procedure TfrmEditProperties.ToolButton2Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmEditProperties.GetCurrVidOplInfo;
var temp_dataset:TpFibDataSet;
begin
       temp_dataset:=TpFibDataSet.Create(self);
       temp_dataset.Database:=WorkDatabase;
       temp_dataset.Transaction:=ReadTransaction;
       try
                 temp_dataset.SQLs.SelectSQL.Text:=' SELECT * FROM SP_VIDOPL WHERE ID_VIDOPL='+IntToStr(Curr_id_vidopl);
                 temp_dataset.Open;
                 temp_dataset.FetchAll;
                 if (temp_dataset.RecordCount>0)
                 then begin
                              VO_KOD  :=temp_dataset.FieldByName('KOD_VIDOPL').AsString;
                              VO_TITLE:=temp_dataset.FieldByName('NAME_VIDOPL').AsString;

                              Caption:='Властивості виду оплат '+': '+ VO_KOD+' '+'"'+
                              VO_TITLE+'" на '+DateToStr(Curr_data);
                 end;
                 temp_dataset.Free;
       except on E:Exception do
                 begin
                   ShowMessage(E.Message);
                 end;
       end;end;

procedure TfrmEditProperties.cxGrid1DBTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
     if (ARecord.Values[7]<>NULL)
     then begin
               if Trim(VarToStr(ARecord.Values[7]))='clGreen'
               then AStyle:=GreenStyle;

               if Trim(VarToStr(ARecord.Values[7]))='clBlack'
               then AStyle:=BalckStyle;

               if Trim(VarToStr(ARecord.Values[7]))='clBlue'
               then AStyle:=BlueStyle;

               if Trim(VarToStr(ARecord.Values[7]))='clRed'
               then AStyle:=RedStyle;

               if Trim(VarToStr(ARecord.Values[7]))='clAqua'
               then AStyle:=AquaStyle;

               if Trim(VarToStr(ARecord.Values[7]))='clPurple'
               then AStyle:=PurpleStyle;

               if Trim(VarToStr(ARecord.Values[7]))='clSkyBlue'
               then AStyle:=SkyBlueStyle;
     end;
end;

end.
