unit StajForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBQuery, pFIBQuery, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, cxGridTableView, ActnList,
  Buttons, ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, RaiseStajAdd, uFormControl,
  RaiseStajData, ComCtrls, cxTextEdit, cxCalendar,pFibStoredProc;

type
  TRaiseForm = class(TForm)
    KeyList: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    AddAction: TAction;
    ModifyAction: TAction;
    DeleteAction: TAction;
    cxStyleRepository1: TcxStyleRepository;
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
    RefreshAction: TAction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    AddButton: TSpeedButton;
    ModifyButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    cxGrid1: TcxGrid;
    PostView: TcxGridDBTableView;
    PostViewDBColumn1: TcxGridDBColumn;
    PostViewDBColumn2: TcxGridDBColumn;
    PostViewDBColumn3: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    cxGrid2: TcxGrid;
    CatraiseView: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton11: TSpeedButton;
    cxGrid3: TcxGrid;
    RaiseView: TcxGridDBTableView;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
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
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    PostViewDBColumn4: TcxGridDBColumn;
    PostViewDBColumn5: TcxGridDBColumn;
    TabSheet3: TTabSheet;
    cxGrid4: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    Panel4: TPanel;
    SpeedButton8: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton12: TSpeedButton;
    cxGrid5: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    Panel5: TPanel;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    PostViewDBColumn6: TcxGridDBColumn;
    cxGridDBTableView2DBColumn1: TcxGridDBColumn;
    procedure CancelActionExecute(Sender: TObject);
    procedure AddActionExecute(Sender: TObject);
    procedure ModifyActionExecute(Sender: TObject);
    procedure DeleteActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure RaiseViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure RaiseViewKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RaiseViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton11Click(Sender: TObject);
    procedure cxGridDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
  Id_Config:Integer;
  ID_CONFIG_ST_ZV:Integer;
    { Public declarations }
  end;



implementation

uses RaiseCatStajAdd, UPostEdit, RasieStZvStaj;
{$R *.dfm}


procedure TRaiseForm.CancelActionExecute(Sender: TObject);
begin
  close;
end;

procedure TRaiseForm.AddActionExecute(Sender: TObject);
var
  RaiseStajAdd: TAddRaise;
  InsertSP:TpFibStoredProc;
  id_config:Integer;
begin
      RaiseStajAdd:= TAddRaise.Create(self);
      if (RaiseStajAdd.ShowModal=mrYes)
      then begin
                 InsertSP:=TpFibStoredProc.Create(self);
                 InsertSP.Database:=dm.DB;
                 InsertSP.Transaction:=dm.WriteTransaction;
                 dm.WriteTransaction.StartTransaction;
                 InsertSP.StoredProcName:='ASUP_MAN_STAJ_RAISE_IU';
                 InsertSP.Prepare;
                 InsertSP.ParamByName('ID_STAJ').Value   :=RaiseStajAdd.cxLookupComboBox1.EditValue;
                 InsertSP.ParamByName('ID_RAISE').Value  :=RaiseStajAdd.id_raise;
                 InsertSP.ParamByName('YEARS_NEED').Value:=StrToInt(RaiseStajAdd.cxCalcEdit1.Text);
                 InsertSP.ParamByName('RAISE_PERS').Value:=StrToInt(RaiseStajAdd.cxCalcEdit2.Text);
                 InsertSP.ParamByName('DATE_BEG').Value  :=RaiseStajAdd.cxDateEdit1.Date;
                 InsertSP.ParamByName('DATE_END').Value  :=RaiseStajAdd.cxDateEdit2.Date;
                 InsertSP.ExecProc;
                 id_config:=InsertSP.ParamByName('NEW_ID_CONFIG').Value;
                 dm.WriteTransaction.Commit;

                 RaiseView.BeginUpdate;
                 dm.SelectRaise.CloseOpen(true);
                 dm.SelectRaise.Locate('ID_CONFIG',id_config,[]);
                 RaiseView.EndUpdate;

                 InsertSP.Close;
                 InsertSP.Free;
      end;
end;

procedure TRaiseForm.ModifyActionExecute(Sender: TObject);
var
  RaiseStajAdd: TAddRaise;
  InsertSP:TpFibStoredProc;
  id_config:Integer;
begin
      RaiseStajAdd:= TAddRaise.Create(self);
      RaiseStajAdd.cxLookupComboBox1.EditValue:=dm.SelectRaise.FieldByName('ID_STAJ').Value;
      RaiseStajAdd.cxLookupComboBox1.Text:=dm.SelectRaise.FieldByName('name_staj').AsString;
      RaiseStajAdd.id_raise                   :=dm.SelectRaise.FieldByName('ID_RAISE').Value;
      RaiseStajAdd.cxButtonEdit1.Text         :=dm.SelectRaise.FieldByName('FULL_NAME_RAISE').AsString;
      RaiseStajAdd.cxCalcEdit1.Text           :=dm.SelectRaise.FieldByName('YEARS_NEEDS').AsString;
      RaiseStajAdd.cxCalcEdit2.Text           :=dm.SelectRaise.FieldByName('RAISE_PERS').AsString;
      RaiseStajAdd.cxDateEdit1.Date           :=dm.SelectRaise.FieldByName('DATE_BEG').Value;
      RaiseStajAdd.cxDateEdit2.Date           :=dm.SelectRaise.FieldByName('DATE_END').Value;

      if (RaiseStajAdd.ShowModal=mrYes)
      then begin
                 InsertSP:=TpFibStoredProc.Create(self);
                 InsertSP.Database:=dm.DB;
                 InsertSP.Transaction:=dm.WriteTransaction;
                 dm.WriteTransaction.StartTransaction;
                 InsertSP.StoredProcName:='ASUP_MAN_STAJ_RAISE_IU';
                 InsertSP.Prepare;
                 InsertSP.ParamByName('ID_STAJ').Value   :=RaiseStajAdd.cxLookupComboBox1.EditValue;
                 InsertSP.ParamByName('ID_RAISE').Value  :=RaiseStajAdd.id_raise;
                 InsertSP.ParamByName('YEARS_NEED').Value:=StrToInt(RaiseStajAdd.cxCalcEdit1.Text);
                 InsertSP.ParamByName('RAISE_PERS').Value:=StrToInt(RaiseStajAdd.cxCalcEdit2.Text);
                 InsertSP.ParamByName('DATE_BEG').Value  :=RaiseStajAdd.cxDateEdit1.Date;
                 InsertSP.ParamByName('DATE_END').Value  :=RaiseStajAdd.cxDateEdit2.Date;
                 InsertSP.ParamByName('ID_CONFIG').Value :=dm.SelectRaise.FieldByName('ID_CONFIG').Value;
                 id_config:=dm.SelectRaise.FieldByName('ID_CONFIG').Value;
                 InsertSP.ExecProc;
                 dm.WriteTransaction.Commit;

                 RaiseView.BeginUpdate;
                 dm.SelectRaise.CloseOpen(true);
                 dm.SelectRaise.Locate('ID_CONFIG',id_config,[]);
                 RaiseView.EndUpdate;

                 InsertSP.Close;
                 InsertSP.Free;
      end;
end;

procedure TRaiseForm.DeleteActionExecute(Sender: TObject);
begin
      If Dm.SelectRaise.IsEmpty
      then begin
                 MessageDlg('Не можливо видалити пустий запис!',mtError,[mbYes],0);
                 Exit;
      end;

      if (MessageDlg('Чи ви справді бажаєте вилучити цей запис?',mtConfirmation,[mbYes,mbNo],0) = mrNo)
      then Exit;

      try
                Dm.DefaultTransaction.StartTransaction;
                Dm.DelStajRaise.ParamByName('Id_config').AsInteger:=Dm.SelectRaise['Id_config'];
                Dm.DelStajRaise.ExecProc;
                Dm.DefaultTransaction.Commit;
                Dm.SelectRaise.Close;
                Dm.SelectRaise.Open;
                DM.CatRegSet.Close;
                DM.CatRegSet.Open;
                DM.SelectRaise.Close;
                DM.SelectRaise.Open;
                DM.PostRegSet.Close;
                dm.PostRegSet.ParamByName('ID_CONFIG_ST_ZV').AsInteger:=ID_CONFIG_ST_ZV;
                DM.PostRegSet.Open;
                DM.SelectCatRaise.Close;
                DM.SelectCatRaise.Open;
      except on e: Exception do
                begin
                      MessageDlg('Не вдалося видалити запис: '+#13+e.Message,mtError,[mbYes],0);
                      Dm.DefaultTransaction.Rollback;
                end;
      end;
end;

procedure TRaiseForm.RefreshActionExecute(Sender: TObject);
begin
      Dm.SelectRaise.Close;
      Dm.SelectRaise.Open;
end;

procedure TRaiseForm.FormCreate(Sender: TObject);
begin
      Dm.SelectRaise.Open;
      Dm.SelectCatRaise.Open;
      Dm.StajDataSet.Open;
      Dm.CatDataSet.Open;
      Dm.sp_post.Open;
      DM.CatRegSet.Open;
      DM.PostRegSet.ParamByName('ID_CONFIG_ST_ZV').AsInteger:=DM.CatRegSet['ID_CONFIG_ST_ZV'];
      DM.PostRegSet.Open;
end;

procedure TRaiseForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TRaiseForm.SpeedButton1Click(Sender: TObject);
var T:TfrmCatRaiseStajEdit;
    InsertSP:TpFibStoredProc;
    ID_CAT_RAISE:Integer;
begin
     T:=TfrmCatRaiseStajEdit.Create(self);
     if T.ShowModal=mrYes
     then begin
               InsertSP:=TpFibStoredProc.Create(self);
               InsertSP.Database:=dm.DB;
               InsertSP.Transaction:=dm.WriteTransaction;
               dm.WriteTransaction.StartTransaction;
               InsertSP.StoredProcName:='ASUP_STAJ_BONUS_CAT_RAI_INSERT';
               InsertSP.Prepare;
               InsertSP.ParamByName('ID_CATEGORY').Value:=T.cxLookupComboBox2.EditValue;
               InsertSP.ParamByName('ID_RAISE').Value   :=T.id_raise;
               InsertSP.ParamByName('ID_STAJ').Value    :=T.cxLookupComboBox1.EditValue;
               InsertSP.ExecProc;
               ID_CAT_RAISE:=InsertSP.ParamByName('ID_CAT_RAISE').Value;
               dm.WriteTransaction.Commit;
               InsertSP.Close;
               InsertSP.Free;

               CatraiseView.BeginUpdate;
               dm.SelectCatRaise.CloseOpen(true);
               dm.SelectCatRaise.Locate('ID_CAT_RAISE',ID_CAT_RAISE,[]);
               CatraiseView.EndUpdate;
     end;
     T.Free;
end;

procedure TRaiseForm.SpeedButton4Click(Sender: TObject);
var DeleteSP:TpFibStoredProc;
begin
      If Dm.SelectCatRaise.IsEmpty
      then begin
                 MessageDlg('Не можливо видалити пустий запис!',mtError,[mbYes],0);
                 Exit;
      end;

      if (MessageDlg('Чи ви справді бажаєте вилучити цей запис?',mtConfirmation,[mbYes,mbNo],0) = mrNo)
      then Exit;

      try
                DeleteSP:=TpFibStoredProc.Create(self);
                DeleteSP.Database:=dm.DB;
                DeleteSP.Transaction:=dm.WriteTransaction;
                dm.WriteTransaction.StartTransaction;
                DeleteSP.StoredProcName:='ASUP_STAJ_BONUS_CAT_RAI_DELETE';
                DeleteSP.Prepare;
                DeleteSP.ParamByName('ID_CAT_RAISE').AsInteger:=Dm.SelectCatRaise['ID_CAT_RAISE'];
                DeleteSP.ExecProc;
                Dm.WriteTransaction.Commit;
                Dm.SelectCatRaise.Close;
                Dm.SelectCatRaise.Open;
      except on e: Exception do
                begin
                      MessageDlg('Не вдалося видалити запис: '+#13+e.Message,mtError,[mbYes],0);
                      Dm.WriteTransaction.Rollback;
                end;
      end;
end;

procedure TRaiseForm.SpeedButton2Click(Sender: TObject);
var T:TfrmPostEdit;
    InsertSP:TpFIBStoredProc;
    id_rec:Int64;
begin
     if dm.SelectRaise.RecordCount>0
     then begin
               Id_Config:=DM.SelectRaise['ID_CONFIG'];
               T:=TfrmPostEdit.Create(self);
               if T.ShowModal=mrOk
               then begin
                         InsertSP:=TPfibStoredProc.Create(self);
                         InsertSP.Database:=DM.DB;
                         InsertSP.Transaction:=DM.WriteTransaction;
                         DM.WriteTransaction.StartTransaction;
                         InsertSP.StoredProcName:='UP_STAJ_RAISE_CONFIG_INS';
                         InsertSP.Prepare;
                         InsertSP.ParamByName('ID_CONFIG').Value:=Id_Config;
                         if T.cxRadioButton1.Checked
                         then begin
                                   InsertSP.ParamByName('IS_CATEGORY').Value:=1;
                                   InsertSP.ParamByName('ID_CATEGORY').Value:=T.cxLookupComboBox2.EditValue;
                         end
                         else begin
                                   InsertSP.ParamByName('IS_CATEGORY').Value:=0;
                                   InsertSP.ParamByName('ID_POST_SALARY').Value    :=T.Id_Post_Salary;
                                  // showmessage(inttostr(T.Id_Post_Salary));
                         end;
                         InsertSP.ExecProc;
                         id_rec:=InsertSP.ParamByName('ID_REC').AsInteger;
                         DM.WriteTransaction.Commit;
                         dm.PostDataSet.CloseOpen(true);
                         DM.PostDataSet.Locate('id_rec',id_rec,[]);
               end;
               T.Free;
     end;
end;

procedure TRaiseForm.SpeedButton9Click(Sender: TObject);
var DropSP:TpFibStoredProc;
begin
     if (dm.PostDataSet.RecordCount>0)
     then begin
          if (MessageDlg('Ви хочете видалити запис?', mtConfirmation, [mbYes, mbNo],0) = mrYes)
          then Begin
               DropSP:=TpFibStoredProc.Create(self);
               DropSP.Database:=dm.DB;
               DropSP.Transaction:=DM.WriteTransaction;
               DM.WriteTransaction.StartTransaction;
               DropSP.StoredProcName:='UP_STAJ_RAISE_CONFIG_DEL';
               DropSP.Prepare;
               DropSP.ParamByName('id_rec').Value:=dm.PostDataSet.FieldByName('id_rec').Value;
               DropSP.ExecProc;
               DropSP.Close;
               DM.WriteTransaction.Commit;
               dm.PostDataSet.CacheDelete;
               DropSP.Free;
          end;
     end;
end;

procedure TRaiseForm.RaiseViewCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
     ID_CONFIG_ST_ZV:=dm.CatRegSet['ID_CONFIG_ST_ZV'];
     //showmessage('id_config='+inttostr(Id_Config));
     dm.PostRegSet.Close;
     dm.PostRegSet.ParamByName('ID_CONFIG').AsInteger:=ID_CONFIG_ST_ZV;
     dm.PostRegSet.Open;
end;

procedure TRaiseForm.RaiseViewKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     ID_CONFIG_ST_ZV:=dm.CatRegSet['ID_CONFIG_ST_ZV'];
     //showmessage('id_config='+inttostr(Id_Config));
     dm.PostRegSet.Close;
     dm.PostRegSet.ParamByName('ID_CONFIG').AsInteger:=ID_CONFIG_ST_ZV;
     dm.PostRegSet.Open;
end;

procedure TRaiseForm.RaiseViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     ID_CONFIG_ST_ZV:=dm.CatRegSet['ID_CONFIG_ST_ZV'];
     //showmessage('id_config='+inttostr(Id_Config));
     dm.PostRegSet.Close;
     dm.PostRegSet.ParamByName('ID_CONFIG').AsInteger:=ID_CONFIG_ST_ZV;
     dm.PostRegSet.Open;
end;

procedure TRaiseForm.SpeedButton11Click(Sender: TObject);
begin
    dm.PostDataSet.Close;
   // showmessage('id_config='+inttostr(Id_Config));
    dm.PostDataSet.ParamByName('ID_CONFIG').AsInteger:=Id_Config;
    dm.PostDataSet.Open;
end;

procedure TRaiseForm.cxGridDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
     ID_CONFIG_ST_ZV:=DM.CatRegSet['ID_CONFIG_ST_ZV'];
     //showmessage('ID_CONFIG_ST_ZV='+inttostr(ID_CONFIG_ST_ZV));
     DM.PostRegSet.Close;
     DM.PostRegSet.ParamByName('ID_CONFIG_ST_ZV').AsInteger:=ID_CONFIG_ST_ZV;
     DM.PostRegSet.Open;
end;

procedure TRaiseForm.cxGridDBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     ID_CONFIG_ST_ZV:=DM.CatRegSet['ID_CONFIG_ST_ZV'];
     //showmessage('ID_CONFIG_ST_ZV='+inttostr(ID_CONFIG_ST_ZV));
     DM.PostRegSet.Close;
     DM.PostRegSet.ParamByName('ID_CONFIG_ST_ZV').AsInteger:=ID_CONFIG_ST_ZV;
     DM.PostRegSet.Open;
end;

procedure TRaiseForm.cxGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     ID_CONFIG_ST_ZV:=DM.CatRegSet['ID_CONFIG_ST_ZV'];
     //showmessage('ID_CONFIG_ST_ZV='+inttostr(ID_CONFIG_ST_ZV));
     DM.PostRegSet.Close;
     DM.PostRegSet.ParamByName('ID_CONFIG_ST_ZV').AsInteger:=ID_CONFIG_ST_ZV;
     DM.PostRegSet.Open;
end;

procedure TRaiseForm.SpeedButton13Click(Sender: TObject);
var
  RaiseStajStZv: TfrmStZvStaj;
  InsertSP:TpFibStoredProc;
  id_config_s:Integer;
begin
      RaiseStajStZv:= TfrmStZvStaj.Create(self);
      if (RaiseStajStZv.ShowModal=mrYes)
      then begin
                 InsertSP:=TpFibStoredProc.Create(self);
                 InsertSP.Database:=dm.DB;
                 InsertSP.Transaction:=dm.WriteTransaction;
                 dm.WriteTransaction.StartTransaction;
                 InsertSP.StoredProcName:='UP_ST_ZV_RAISE_CONFIG_IU';
                 InsertSP.Prepare;
                 InsertSP.ParamByName('ID_RAISE').Value  :=RaiseStajStZv.id_raise;
                 InsertSP.ParamByName('DATE_BEG').Value  :=RaiseStajStZv.cxDateBeg.Date;
                 InsertSP.ParamByName('DATE_END').Value  :=RaiseStajStZv.cxDateEnd.Date;
                 InsertSP.ExecProc;
                 id_config_s:=InsertSP.ParamByName('NEW_ID_CONFIG').Value;
                 dm.WriteTransaction.Commit;
                 //RaiseView.BeginUpdate;
                 dm.CatRegSet.CloseOpen(true);
                 dm.CatRegSet.Locate('ID_CONFIG_ST_ZV',id_config_s,[]);
                 DM.PostRegSet.Close;
                 DM.PostRegSet.ParamByName('ID_CONFIG_ST_ZV').AsInteger:=id_config_s;
                 DM.PostRegSet.Open;
                 //RaiseView.EndUpdate;

                 InsertSP.Close;
                 InsertSP.Free;
      end;
      
end;

procedure TRaiseForm.SpeedButton14Click(Sender: TObject);
var
  RaiseStajStZv: TfrmStZvStaj;
  InsertSP:TpFibStoredProc;
  id_config:Integer;
begin
      RaiseStajStZv:= TfrmStZvStaj.Create(self);
      RaiseStajStZv.id_raise:=dm.CatRegSet['ID_RAISE'];
      RaiseStajStZv.SprRaise.Text:=dm.CatRegSet['Full_Name_Raise'];
      RaiseStajStZv.cxDateBeg.Date:=DM.CatRegSet['DATE_BEG'];
      RaiseStajStZv.cxDateEnd.Date:=DM.CatRegSet['DATE_END'];
      if (RaiseStajStZv.ShowModal=mrYes)
      then begin
                 InsertSP:=TpFibStoredProc.Create(self);
                 InsertSP.Database:=dm.DB;
                 InsertSP.Transaction:=dm.WriteTransaction;
                 dm.WriteTransaction.StartTransaction;
                 InsertSP.StoredProcName:='UP_ST_ZV_RAISE_CONFIG_IU';
                 InsertSP.Prepare;
                 InsertSP.ParamByName('ID_RAISE').Value  :=RaiseStajStZv.id_raise;
                 InsertSP.ParamByName('DATE_BEG').Value  :=RaiseStajStZv.cxDateBeg.Date;
                 InsertSP.ParamByName('DATE_END').Value  :=RaiseStajStZv.cxDateEnd.Date;
                 InsertSP.ParamByName('ID_CONFIG_ST_ZV').Value  :=ID_CONFIG_ST_ZV;
                 InsertSP.ExecProc;
                 dm.WriteTransaction.Commit;
                 //RaiseView.BeginUpdate;
                 dm.CatRegSet.CloseOpen(true);
                 dm.CatRegSet.Locate('ID_CONFIG_ST_ZV',ID_CONFIG_ST_ZV,[]);
                 //RaiseView.EndUpdate;

                 InsertSP.Close;
                 InsertSP.Free;
      end;
end;
procedure TRaiseForm.SpeedButton8Click(Sender: TObject);
var T:TfrmPostEdit;
    InsertSP:TpFIBStoredProc;
    id_rec:Int64;
begin
     if dm.SelectRaise.RecordCount>0
     then begin
               Id_Config:=DM.SelectRaise['ID_CONFIG'];
               T:=TfrmPostEdit.Create(self);
               if T.ShowModal=mrOk
               then begin
                         InsertSP:=TPfibStoredProc.Create(self);
                         InsertSP.Database:=DM.DB;
                         InsertSP.Transaction:=DM.WriteTransaction;
                         DM.WriteTransaction.StartTransaction;
                         InsertSP.StoredProcName:='UP_POST_ST_ZV_CONFIG_INS';
                         InsertSP.Prepare;
                         InsertSP.ParamByName('ID_CONFIG_ST_ZV').Value:=ID_CONFIG_ST_ZV;
                         if T.cxRadioButton1.Checked
                         then begin
                                   InsertSP.ParamByName('IS_CATEGORY').Value:=1;
                                   InsertSP.ParamByName('ID_CATEGORY').Value:=T.cxLookupComboBox2.EditValue;
                         end
                         else begin
                                   InsertSP.ParamByName('IS_CATEGORY').Value:=0;
                                   InsertSP.ParamByName('ID_POST_SALARY').Value    :=T.Id_Post_Salary;
                                  // showmessage(inttostr(T.Id_Post_Salary));
                         end;
                         InsertSP.ExecProc;
                         id_rec:=InsertSP.ParamByName('ID_REC').AsInteger;
                         DM.WriteTransaction.Commit;
                         dm.PostRegSet.CloseOpen(true);
                         DM.PostRegSet.Locate('id_rec',id_rec,[]);
               end;
               T.Free;
     end;
end;

procedure TRaiseForm.SpeedButton10Click(Sender: TObject);
var DropSP:TpFibStoredProc;
begin
     if (dm.PostRegSet.RecordCount>0)
     then begin
          if (MessageDlg('Ви хочете видалити запис?', mtConfirmation, [mbYes, mbNo],0) = mrYes)
          then Begin
               DropSP:=TpFibStoredProc.Create(self);
               DropSP.Database:=dm.DB;
               DropSP.Transaction:=DM.WriteTransaction;
               DM.WriteTransaction.StartTransaction;
               DropSP.StoredProcName:='UP_STAJ_ST_ZV_CONFIG_DEL';
               DropSP.Prepare;
               DropSP.ParamByName('id_rec').Value:=dm.PostRegSet.FieldByName('id_rec').Value;
               DropSP.ExecProc;
               DropSP.Close;
               DM.WriteTransaction.Commit;
               dm.PostRegSet.CacheDelete;
               DropSP.Free;
          end;
     end;
end;

procedure TRaiseForm.SpeedButton15Click(Sender: TObject);
var DropSP:TpFibStoredProc;
begin
     if (dm.CatRegSet.RecordCount>0)
     then begin
          if (MessageDlg('Ви хочете видалити запис?', mtConfirmation, [mbYes, mbNo],0) = mrYes)
          then Begin
               DropSP:=TpFibStoredProc.Create(self);
               DropSP.Database:=dm.DB;
               DropSP.Transaction:=DM.WriteTransaction;
               DM.WriteTransaction.StartTransaction;
               DropSP.StoredProcName:='UP_ST_ZV_RAISE_CONFIG_DEL';
               DropSP.Prepare;
               DropSP.ParamByName('ID_CONFIG_ST_ZV').Value:=ID_CONFIG_ST_ZV;
               DropSP.ExecProc;
               DropSP.Close;
               DM.WriteTransaction.Commit;
               dm.CatRegSet.CacheDelete;
               DropSP.Free;
          end;
     end;
     DM.CatRegSet.Open;
     DM.PostRegSet.Close;
     DM.PostRegSet.ParamByName('ID_CONFIG_ST_ZV').AsInteger:=DM.CatRegSet['ID_CONFIG_ST_ZV'];
     DM.PostRegSet.Open;
     DM.SelectCatRaise.Close;
     DM.SelectCatRaise.Open;
end;

procedure TRaiseForm.SpeedButton17Click(Sender: TObject);
begin
    DM.CatRegSet.Close;
    DM.CatRegSet.Open;
end;

procedure TRaiseForm.SpeedButton12Click(Sender: TObject);
begin
    DM.PostRegSet.Close;
    DM.PostRegSet.ParamByName('ID_CONFIG_ST_ZV').AsInteger:=ID_CONFIG_ST_ZV;
    DM.PostRegSet.Open;
end;

procedure TRaiseForm.SpeedButton7Click(Sender: TObject);
begin
   DM.SelectCatRaise.Close;
   DM.SelectCatRaise.Open;
end;

end.
