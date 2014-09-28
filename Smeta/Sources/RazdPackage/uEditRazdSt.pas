unit uEditRazdSt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,pFibStoredProc,ComCtrls,GlobalSpr,
  pFibDataSet, Resources_unitb, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses,
  cxGridCustomView, cxGrid, FIBDataSet, ActnList;

type
  TfrmEditRazdSt = class(TForm)
    GroupBox1: TGroupBox;
    EdRazdStNum: TEdit;
    EdRazdStTitle: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    PlagGroup: TRadioGroup;
    pl_by_rz: TRadioButton;
    pl_by_st: TRadioButton;
    GroupBox3: TGroupBox;
    StPropGroup: TRadioGroup;
    OutProp: TRadioButton;
    InProp: TRadioButton;
    EdInSt_Title: TEdit;
    In_St_Button: TButton;
    CheckBox1: TCheckBox;
    cbProfitable: TcxComboBox;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    cxStyle1: TcxStyle;
    Panel1: TPanel;
    Panel2: TPanel;
    cxGrid1: TcxGrid;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDBBandedColumn2: TcxGridDBBandedColumn;
    cxGridDBBandedColumn3: TcxGridDBBandedColumn;
    cxGridLevel2: TcxGridLevel;
    cxGridDBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    Panel3: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    AnDataSet: TpFIBDataSet;
    AnDataSource: TDataSource;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Panel4: TPanel;
    RadioGroup1: TRadioGroup;
    ExtendedLink: TEdit;
    Button1: TButton;
    Edit1: TEdit;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormShow(Sender: TObject);
    procedure InPropClick(Sender: TObject);
    procedure OutPropClick(Sender: TObject);
    procedure In_St_ButtonClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    EditFlag:Boolean;
    ViewFlag:Boolean;
    SUM_TO_OBJ:Integer;
    ExtendndedLink:Integer;
    RazdStMode:Boolean;
    procedure InsertData;
    procedure UpdateData;
    function CheckInputData:Boolean;

  end;

implementation

uses URazdSt, uEditStAnalitic, BaseTypes;
{$R *.dfm}

procedure TfrmEditRazdSt.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize:=false;
end;

procedure TfrmEditRazdSt.FormShow(Sender: TObject);
var temp_dataset:TpFibDataSet;
    Date_str:string;
begin
    if EditFlag
    then begin
             EdRazdStNum.Text:=TfrmRazdSt(owner).RazdDataSet.FieldByName('RAZD_ST_NUM').asString;
             EdRazdStTitle.Text:=TfrmRazdSt(owner).RazdDataSet.FieldByName('RAZD_ST_TITLE').AsString;

             if TfrmRazdSt(owner).RazdDataSet.FieldByName('ENABLE').AsBoolean
             then CheckBox1.Checked:=true
             else CheckBox1.Checked:=false;

             if TfrmRazdSt(owner).RazdDataSet.FieldByName('PROFITABLE').AsBoolean
             then begin
                       cbProfitable.ItemIndex:=1;
                       Panel4.Visible:=false;

                       ExtendedLink.Text:='';
                       Edit1.Text       :='';
                       ExtendndedLink   :=0;
             end
             else begin
                       cbProfitable.ItemIndex:=0;
                       ExtendedLink.Text:=TfrmRazdSt(owner).RazdDataSet.FieldByName('EXTENDED_LINK_TEXT').AsString;
                       Edit1.Text       :=TfrmRazdSt(owner).RazdDataSet.FieldByName('R_EXTENDED_LINK_TEXT').AsString;
                       if TfrmRazdSt(owner).RazdDataSet.FieldByName('EXTENDED_LINK').Value<>null
                       then ExtendndedLink   :=TfrmRazdSt(owner).RazdDataSet.FieldByName('EXTENDED_LINK').Value;
             end;

             if TfrmRazdSt(owner).RazdDataSet.FieldByName('PL_BY_RAZ').AsBoolean
             then pl_by_rz.Checked:=true
             else pl_by_st.Checked:=true;

             if not TfrmRazdSt(owner).RazdDataSet.FieldByName('IS_VALID').AsBoolean
             then begin
                InProp.Checked:=true;
                InProp.OnClick(self);
                SUM_TO_OBJ:=TfrmRazdSt(owner).RazdDataSet.FieldByName('SUM_TO_OBJ').value;
                temp_dataset:=TpFibDataSet.Create(self);
                temp_dataset.Database:=TfrmRazdSt(owner).WorkDatabase;
                temp_dataset.Transaction:=TfrmRazdSt(owner).ReadTransaction;
                dateTimetostring(Date_str,'dd.mm.yyyy', TfrmRazdSt(owner).ActualDate);
                temp_dataset.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RAZD_ST_SELECT(0) WHERE ID_RAZD_ST='+IntToStr(SUM_TO_OBJ);
                temp_dataset.Open;
                temp_dataset.FetchAll;
                if temp_dataset.RecordCount>0
                then begin
                   EdInSt_Title.Text:=temp_dataset.FieldByName('OBJ_TITLE').AsString+' '+temp_dataset.FieldByName('RAZD_ST_NUM').AsString+' "'+temp_dataset.FieldByName('RAZD_ST_TITLE').AsString+'"';
                end;

             end;


             if TfrmRazdSt(owner).RazdDataSet.FieldByName('IS_RAZDEL').asInteger=1
             then begin

                PlagGroup.Enabled:=true;
                pl_by_rz.Enabled:=true;
                pl_by_st.Enabled:=true;

                StPropGroup.Enabled:=false;
                OutProp.Enabled:=false;
                InProp.Enabled:=false;
                EdInSt_Title.Enabled:=false;
                EdInSt_Title.Color:=clGray;
                In_St_Button.Enabled:=false;

                cxGrid1.Enabled:=False;                
                cxButton3.Enabled:=False;
                cxButton4.Enabled:=False;
                cxButton5.Enabled:=False;
             end
             else begin
                PlagGroup.Enabled:=false;
                pl_by_rz.Enabled:=false;
                pl_by_st.Enabled:=false;

                StPropGroup.Enabled:=true;
                OutProp.Enabled:=true;
                InProp.Enabled:=true;
                if InProp.Checked
                then begin
                    EdInSt_Title.Enabled:=true;
                    EdInSt_Title.Color:=clInfoBk;
                    In_St_Button.Enabled:=true;
                end
                else begin
                    EdInSt_Title.Enabled:=false;
                    EdInSt_Title.Color:=clGray;
                    In_St_Button.Enabled:=false;
                end;
             end;
    end
    else begin
             SUM_TO_OBJ:=0;
             if TfrmRazdSt(owner).RazdDataSet.FieldByName('PROFITABLE').AsBoolean
             then cbProfitable.ItemIndex:=1
             else cbProfitable.ItemIndex:=0;

             if TfrmRazdSt(owner).RazdDataSet.FieldByName('IS_RAZDEL').AsInteger=-1
             then begin
             //Добавляем раздел
                              PlagGroup.Enabled:=true;
                              pl_by_rz.Enabled:=true;
                              pl_by_st.Enabled:=true;

                              StPropGroup.Enabled:=false;
                              OutProp.Enabled:=false;
                              InProp.Enabled:=false;
                              EdInSt_Title.Enabled:=false;
                              EdInSt_Title.Color:=clGray;
                              In_St_Button.Enabled:=false;

                              cxButton3.Enabled:=False;
                              cxButton4.Enabled:=False;
                              cxButton5.Enabled:=False;
                              cxGrid1.Enabled:=False;
             end;
             if TfrmRazdSt(owner).RazdDataSet.FieldByName('IS_RAZDEL').asInteger=1
             then begin
             //Добавляем статью
                              cbProfitable.Visible:=false;
                              PlagGroup.Enabled:=false;
                              pl_by_rz.Enabled:=false;
                              pl_by_st.Enabled:=false;

                              StPropGroup.Enabled:=true;
                              OutProp.Enabled:=true;
                              InProp.Enabled:=true;
                              if InProp.Checked
                              then begin
                                  EdInSt_Title.Enabled:=true;
                                  EdInSt_Title.Color:=clInfoBk;
                                  In_St_Button.Enabled:=true;
                              end
                              else begin
                                  EdInSt_Title.Enabled:=false;
                                  EdInSt_Title.Color:=clGray;
                                  In_St_Button.Enabled:=false;
                              end;
             end;
    end;

    if ViewFlag
    then begin
              cxButton1.Visible:=false;
    end;

end;

procedure TfrmEditRazdSt.InPropClick(Sender: TObject);
begin
      if InProp.Checked
      then begin
          EdInSt_Title.Enabled:=true;
          EdInSt_Title.Color:=clInfoBk;
          In_St_Button.Enabled:=true;
      end
      else begin
          EdInSt_Title.Enabled:=false;
          EdInSt_Title.Color:=clGray;
          In_St_Button.Enabled:=false;
      end;
end;

procedure TfrmEditRazdSt.OutPropClick(Sender: TObject);
begin
      if InProp.Checked
      then begin
          EdInSt_Title.Enabled:=true;
          EdInSt_Title.Color:=clInfoBk;
          In_St_Button.Enabled:=true;
      end
      else begin
          EdInSt_Title.Enabled:=false;
          EdInSt_Title.Color:=clGray;
          In_St_Button.Enabled:=false;
      end;
end;

function TfrmEditRazdSt.CheckInputData: Boolean;
var ResChecking:Boolean;
begin
        ResChecking:=true;

        if (EdRazdStNum.Text='') and ResChecking
        then begin
             EdRazdStNum.SetFocus;
             ResChecking:=false;
             MessageBox(Application.Handle,PChar(BU_TitleError),PChar(BU_ErrorCaption),MB_OK and MB_ICONERROR);
        end;

        if (EdRazdStTitle.Text='') and ResChecking
        then begin
             EdRazdStTitle.SetFocus;
             ResChecking:=false;
             MessageBox(Application.Handle,PChar(BU_TitleError),PChar(BU_ErrorCaption),MB_OK and MB_ICONERROR);
        end;

        if (cbProfitable.ItemIndex=-1) and ResChecking
        then begin
             cbProfitable.SetFocus;
             ResChecking:=false;
             MessageBox(Application.Handle,PChar(BU_TitleError),PChar(BU_ErrorCaption),MB_OK and MB_ICONERROR);
        end;

        if (InProp.Checked) and (EdInSt_Title.Text='') and ResChecking
        then begin
             In_St_Button.SetFocus;
             ResChecking:=false;
             MessageBox(Application.Handle,PChar(BU_TitleError),PChar(BU_ErrorCaption),MB_OK and MB_ICONERROR);
        end;

        CheckInputData:=ResChecking;
end;

procedure TfrmEditRazdSt.InsertData;
var Proc:TpFibStoredProc;
    id:Integer;
begin
            id:=0;
            Proc:=TpFibStoredProc.Create(self);
            Proc.Database:=TfrmRazdSt(owner).WorkDatabase;
            Proc.Transaction:=TfrmRazdSt(owner).WriteTransaction;
            proc.StoredProcName:='PUB_RAZD_ST_INSERT';
            TfrmRazdSt(owner).WriteTransaction.StartTransaction;
            try
                  proc.Prepare;
                  proc.ParamByName('P_RAZD_ST_NUM').AsString:=EdRazdStNum.Text;
                  proc.ParamByName('P_RAZD_ST_TITLE').value:=TRIM(EdRazdStTitle.Text);

                  proc.ParamByName('P_PROFITABLE').value:=Boolean(cbProfitable.ItemIndex);
                  proc.ParamByName('P_ENABLE').value:=CheckBox1.Checked;
                  proc.ParamByName('P_PL_BY_RAZ').value:=pl_by_rz.Checked;
                  proc.ParamByName('P_LINKTO').value:=TfrmRazdSt(owner).RazdDataSet.FieldByName('ID_RAZD_ST').Value;

                  if OutProp.Checked
                  then begin
                            proc.ParamByName('P_IS_VALID').value:=1;
                            proc.ParamByName('P_SUM_TO_OBJ').value:=0;

                  end
                  else begin
                            proc.ParamByName('P_IS_VALID').value:=0;
                            proc.ParamByName('P_SUM_TO_OBJ').value:=SUM_TO_OBJ;
                  end;

                  if TfrmRazdSt(owner).RazdDataSet.FieldByName('IS_RAZDEL').AsInteger=1
                  then proc.ParamByName('P_IS_RAZDEL').value:=0
                  else proc.ParamByName('P_IS_RAZDEL').value:=1;

                  proc.ParamByName('P_EXTENDED_LINK').value:=ExtendndedLink;

                  proc.ExecProc;
                  id:=proc.ParamByName('P_ID_RAZD_ST').AsInteger;
            except on E:Exception do
                  begin
                         ShowMessage(E.Message);
                         if TfrmRazdSt(owner).WriteTransaction.InTransaction
                         then TfrmRazdSt(owner).WriteTransaction.Rollback;
                  end;
            end;
            TfrmRazdSt(owner).WriteTransaction.Commit;
            TfrmRazdSt(owner).RazdDataSet.CloseOpen(true);
            TfrmRazdSt(owner).RazdDataSet.Locate('ID_RAZD_ST',id,[]);
            Proc.Free;
end;

procedure TfrmEditRazdSt.UpdateData;
var Proc:TpFibStoredProc;
    id:Integer;
begin
            id:=0;
            Proc:=TpFibStoredProc.Create(self);
            Proc.Database:=TfrmRazdSt(owner).WorkDatabase;
            Proc.Transaction:=TfrmRazdSt(owner).WriteTransaction;
            proc.StoredProcName:='PUB_RAZD_ST_UPDATE';
            TfrmRazdSt(owner).WriteTransaction.StartTransaction;
            try
                  proc.Prepare;
                  proc.ParamByName('P_ID_RAZD_ST').value:=TfrmRazdSt(owner).RazdDataSet.FieldByName('ID_RAZD_ST').Value;
                  id:=TfrmRazdSt(owner).RazdDataSet.FieldByName('ID_RAZD_ST').AsInteger;
                  proc.ParamByName('P_RAZD_ST_NUM').asString:=EdRazdStNum.Text;
                  proc.ParamByName('P_RAZD_ST_TITLE').value:=TRIM(EdRazdStTitle.Text);

                  proc.ParamByName('P_PROFITABLE').value:=Boolean(cbProfitable.ItemIndex);
                  proc.ParamByName('P_ENABLE').value:=CheckBox1.Checked;
                  proc.ParamByName('P_PL_BY_RAZ').value:=pl_by_rz.Checked;
                  proc.ParamByName('P_LINKTO').value:=TfrmRazdSt(owner).RazdDataSet.FieldByName('LINKTO').Value;
                  proc.ParamByName('P_EXTENDED_LINK').value:=ExtendndedLink;

                  if OutProp.Checked
                  then begin
                            proc.ParamByName('P_IS_VALID').value:=1;
                            proc.ParamByName('P_SUM_TO_OBJ').value:=0;

                  end
                  else begin
                            proc.ParamByName('P_IS_VALID').value:=0;
                            proc.ParamByName('P_SUM_TO_OBJ').value:=SUM_TO_OBJ;
                  end;
                  if TfrmRazdSt(owner).RazdDataSet.FieldByName('IS_RAZDEL').asInteger=1
                        then proc.ParamByName('P_IS_RAZDEL').value:=1
                        else proc.ParamByName('P_IS_RAZDEL').value:=0;
                  proc.ExecProc;

            except on Exception do
                  begin
                       TfrmRazdSt(owner).WriteTransaction.Rollback;
                  end;
            end;

            TfrmRazdSt(owner).WriteTransaction.Commit;
            TfrmRazdSt(owner).RazdDataSet.CloseOpen(true);
            TfrmRazdSt(owner).RazdDataSet.Locate('ID_RAZD_ST',id,[]);

            Proc.Free;
end;

procedure TfrmEditRazdSt.In_St_ButtonClick(Sender: TObject);
var   T:TfrmRazdSt;
      Date_str:string;
      temp_dataset:TpFibDataSet;
begin
      T:=TfrmRazdSt.Create(self, TfrmRazdSt(owner).WorkDatabase.Handle,fsNormal, TfrmRazdSt(owner).ActualDate,TfrmRazdSt(owner).RazdDataSet.FieldByName('ID_RAZD_ST').AsInteger,allEnableValid,cmSt);
      if T.ShowModal=mrOk
      then begin
               SUM_TO_OBJ:=T.ResultValue;
               if SUM_TO_OBJ=TfrmRazdSt(owner).RazdDataSet.FieldByName('ID_RAZD_ST').AsInteger
               then begin
                    MessageBox(Application.Handle,PChar(BU_StError),PChar(BU_ErrorCaption),MB_OK and MB_ICONERROR);
                    Exit;
               end;

               dateTimetostring(Date_str,'dd.mm.yyyy', TfrmRazdSt(owner).ActualDate);
               temp_dataset:=TpFibDataSet.Create(self);
               temp_dataset.Database:=TfrmRazdSt(owner).WorkDatabase;
               temp_dataset.Transaction:=TfrmRazdSt(owner).ReadTransaction;
               temp_dataset.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RAZD_ST_SELECT(0) WHERE ID_RAZD_ST='+IntToStr(SUM_TO_OBJ);
               temp_dataset.Open;
               temp_dataset.FetchAll;
               if temp_dataset.RecordCount>0
               then begin
                  EdInSt_Title.Text:=temp_dataset.FieldByName('OBJ_TITLE').AsString+' '+temp_dataset.FieldByName('RAZD_ST_NUM').AsString+' "'+temp_dataset.FieldByName('RAZD_ST_TITLE').AsString+'"';
               end;
      end;
      T.free;
end;

procedure TfrmEditRazdSt.cxButton1Click(Sender: TObject);
begin
if CheckInputData
then begin
     if EditFlag
     then UpdateData
     else InsertData;
     ModalResult:=mrYes;
end;

end;

procedure TfrmEditRazdSt.cxButton2Click(Sender: TObject);
begin
    ModalResult:=mrNo;
end;

procedure TfrmEditRazdSt.cxButton3Click(Sender: TObject);
var InsertSP:TpFibStoredproc;
    id_rec:Integer;
begin
     with TfrmStAnaliticInfo.Create(Self, TfrmRazdSt(owner).WorkDatabase.Handle) do
     begin
          if ShowModal=mrYes
          then begin
                    InsertSP:=TpFibStoredproc.Create(nil);
                    InsertSP.Database:=TfrmRazdSt(self.owner).WorkDatabase;
                    InsertSP.Transaction:=TfrmRazdSt(self.owner).WriteTransaction;

                    TfrmRazdSt(Self.owner).WriteTransaction.StartTransaction;
                    InsertSP.StoredProcName:='PUB_SPR_RAZD_ST_ANALITIC_INS';
                    InsertSP.Prepare;
                    InsertSP.ParamByName('ID_RAZD_ST').Value:=TfrmRazdSt(Self.owner).RazdDataSet.FieldByName('ID_RAZD_ST').AsInteger;
                    InsertSP.ParamByName('ID_ENUM').Value   :=cxButtonEdit1.Tag;
                    InsertSP.ParamByName('DATE_BEG').Value  :=cxDateEdit1.Date;
                    if not EditFlag
                    then begin
                              InsertSP.ParamByName('is_inserting').Value  :=1;
                    end
                    else InsertSP.ParamByName('is_inserting').Value  :=0;

                    InsertSP.ExecProc;

                    id_rec:=InsertSP.ParamByName('ID_REC').Value;

                    if not EditFlag
                    then begin
                              if AnDataSet.Active then AnDataSet.Close;
                              AnDataSet.Database   :=TfrmRazdSt(Self.owner).WorkDatabase;
                              AnDataSet.Transaction:=TfrmRazdSt(Self.owner).ReadTransaction;
                              AnDataSet.SelectSQL.Text:='SELECT * FROM PUB_SPR_RAZD_ST_ANALITIC_SEL('+
                              InsertSP.ParamByName('ID_razd_st_i').AsString+')';
                    end;

                    InsertSP.Close;

                    TfrmRazdSt(Self.owner).WriteTransaction.Commit;

                    AnDataSet.CloseOpen(true);
                    AnDataSet.Locate('id_rec',id_rec,[]);

                    InsertSP.Free;
          end;
          Free;
     end;
end;

procedure TfrmEditRazdSt.cxButton4Click(Sender: TObject);
var InsertSP:TpFibStoredproc;
    id_rec:Integer;
begin
     if AnDataSet.RecordCount>0
     then begin
               with TfrmStAnaliticInfo.Create(Self, TfrmRazdSt(owner).WorkDatabase.Handle) do
               begin
                    cxButtonEdit1.Tag:=AnDataSet.FieldByName('ID_ENUM').Value;
                    cxDateEdit1.Date :=AnDataSet.FieldByName('DATE_BEG').Value;
                    Label3.Visible:=true;
                    cxDateEdit2.Visible:=True;
                    cxDateEdit2.Date :=AnDataSet.FieldByName('DATE_END').Value;
                    cxButtonEdit1.Text:=AnDataSet.FieldByName('ENUM_CODE').AsString+' "'+AnDataSet.FieldByName('ENUM_TITLE').AsString+'"';

                    if ShowModal=mrYes
                    then begin
                              InsertSP:=TpFibStoredproc.Create(nil);
                              InsertSP.Database:=TfrmRazdSt(self.owner).WorkDatabase;
                              InsertSP.Transaction:=TfrmRazdSt(self.owner).WriteTransaction;

                              TfrmRazdSt(Self.owner).WriteTransaction.StartTransaction;
                              InsertSP.StoredProcName:='PUB_SPR_RAZD_ST_ANALITIC_UPD';
                              InsertSP.Prepare;
                              InsertSP.ParamByName('ID_REC').Value    :=AnDataSet.FieldByName('ID_REC').Value;
                              InsertSP.ParamByName('ID_ENUM').Value   :=cxButtonEdit1.Tag;
                              InsertSP.ParamByName('DATE_BEG').Value  :=cxDateEdit1.Date;
                              InsertSP.ParamByName('DATE_END').Value  :=cxDateEdit2.Date;

                              try
                              InsertSP.ExecProc;
                              except on E:Exception do agShowMessage(E.Message);
                              end;

                              id_rec:=InsertSP.ParamByName('ID_REC').Value;
                              InsertSP.Close;

                              TfrmRazdSt(Self.owner).WriteTransaction.Commit;

                              AnDataSet.CloseOpen(true);
                              AnDataSet.Locate('id_rec',id_rec,[]);

                              InsertSP.Free;
                    end;
                    Free;
               end;
      end;         
end;

procedure TfrmEditRazdSt.FormCreate(Sender: TObject);
begin
     AnDataSet.Database   :=TfrmRazdSt(owner).WorkDatabase;
     AnDataSet.Transaction:=TfrmRazdSt(owner).ReadTransaction;
     AnDataSet.SelectSQL.Text:='SELECT * FROM PUB_SPR_RAZD_ST_ANALITIC_SEL('+
     TfrmRazdSt(Self.owner).RazdDataSet.FieldByName('ID_RAZD_ST').AsString+')';
     AnDataSet.Open;
     AnDataSet.FetchAll;
end;

procedure TfrmEditRazdSt.cxButton5Click(Sender: TObject);
var InsertSP:TpFibStoredproc;
begin
     if AnDataSet.RecordCount>0
     then begin
               if agMessageDlg('Увага!','Ви хочете видалити запис?', mtConfirmation, [mbYes, mbNo])=mrYes
               then begin
                         InsertSP:=TpFibStoredproc.Create(nil);
                         InsertSP.Database:=TfrmRazdSt(self.owner).WorkDatabase;
                         InsertSP.Transaction:=TfrmRazdSt(self.owner).WriteTransaction;

                         TfrmRazdSt(Self.owner).WriteTransaction.StartTransaction;
                         InsertSP.StoredProcName:='PUB_SPR_RAZD_ST_ANALITIC_DEL';
                         InsertSP.Prepare;
                         InsertSP.ParamByName('ID_REC').Value:=AnDataSet.FieldByName('ID_REC').Value;
                         InsertSP.ExecProc;

                         InsertSP.Close;

                         TfrmRazdSt(Self.owner).WriteTransaction.Commit;

                         AnDataSet.CacheDelete;

                         InsertSP.Free;
               end;

     end;
end;

procedure TfrmEditRazdSt.Button1Click(Sender: TObject);
var   T:TfrmRazdSt;
      Date_str:string;
      temp_dataset:TpFibDataSet;
      LINKTO:Integer;
begin
      T:=TfrmRazdSt.Create(self, TfrmRazdSt(owner).WorkDatabase.Handle,fsNormal, TfrmRazdSt(owner).ActualDate,TfrmRazdSt(owner).RazdDataSet.FieldByName('ID_RAZD_ST').AsInteger,allEnableProfit,cmSt);
      if T.ShowModal=mrOk
      then begin
               ExtendndedLink:=T.ResultValue;
               if ExtendndedLink=TfrmRazdSt(owner).RazdDataSet.FieldByName('ID_RAZD_ST').AsInteger
               then begin
                    MessageBox(Application.Handle,PChar(BU_StError),PChar(BU_ErrorCaption),MB_OK and MB_ICONERROR);
                    Exit;
               end;

               dateTimetostring(Date_str,'dd.mm.yyyy', TfrmRazdSt(owner).ActualDate);
               temp_dataset:=TpFibDataSet.Create(self);
               temp_dataset.Database:=TfrmRazdSt(owner).WorkDatabase;
               temp_dataset.Transaction:=TfrmRazdSt(owner).ReadTransaction;
               temp_dataset.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RAZD_ST_SELECT(0) WHERE ID_RAZD_ST='+IntToStr(ExtendndedLink);
               temp_dataset.Open;
               temp_dataset.FetchAll;
               if (temp_dataset.RecordCount>0)
               then begin
                         ExtendedLink.Text:=temp_dataset.FieldByName('OBJ_TITLE').AsString+' '+temp_dataset.FieldByName('RAZD_ST_NUM').AsString+' "'+temp_dataset.FieldByName('RAZD_ST_TITLE').AsString+'"';
                         LINKTO:=temp_dataset.FieldByName('LINKTO').Value;
                         temp_dataset.Close;
                         temp_dataset.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_RAZD_ST_SELECT(0) WHERE ID_RAZD_ST='+IntToStr(LINKTO);
                         temp_dataset.Open;
                         temp_dataset.FetchAll;
                         if (temp_dataset.RecordCount>0)
                         then begin
                                   Edit1.Text:=temp_dataset.FieldByName('OBJ_TITLE').AsString+' '+temp_dataset.FieldByName('RAZD_ST_NUM').AsString+' "'+temp_dataset.FieldByName('RAZD_ST_TITLE').AsString+'"';
                         end;
               end;
               temp_dataset.Close;
               temp_dataset.Free;
      end;
      T.free;
end;

end.
