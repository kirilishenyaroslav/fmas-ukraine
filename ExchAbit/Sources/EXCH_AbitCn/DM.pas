unit DM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, ADODB, Variants,Dialogs,Clipbrd;

type
  TDM_IE = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    StProc: TpFIBStoredProc;
    ReadDataSet: TpFIBDataSet;
    GlobalDataR: TADOConnection;
    id_ref_I_dset: TADOStoredProc;
    AmodelkaR: TADOConnection;
    exch_IU_dset: TADOStoredProc;
    j_app_I_dset: TADOStoredProc;
    app_dset: TADOStoredProc;
    exch_app_dset: TADOStoredProc;
    S_dset: TADOStoredProc;
    GetPeopleID_dset: TADOStoredProc;
    SQ_dset: TADOStoredProc;
    AmodelkaRW: TADOConnection;
    GlobalDataRW: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure INI_TYPE_PLACE_1_to_0;
    procedure INI_TYPE_PLACE_0_to_1;
    procedure INI_TYPE_REGION_1_to_0;
    procedure INI_TYPE_REGION_0_to_1;
    procedure INI_TYPE_STREET_1_to_0;
    procedure INI_TYPE_STREET_0_to_1;
    procedure INI_TYPE_DISTRICT_1_to_0;
    procedure INI_TYPE_DISTRICT_0_to_1;
    procedure PUB_INI_PASS_TYPE_1_to_0;
    procedure PUB_INI_PASS_TYPE_0_to_1;
    procedure ADR_COUNTRY_1_to_0;
    procedure ADR_COUNTRY_0_to_1;
    procedure ADR_REGION_1_to_0;
    procedure ADR_REGION_0_to_1;
    procedure ADR_DISTRICT_1_to_0;
    procedure ADR_DISTRICT_0_to_1;
    procedure ADR_PLACE_1_to_0;
    procedure ADR_PLACE_0_to_1;
    procedure ADR_CITY_AREA_1_to_0;
    procedure ADR_CITY_AREA_0_to_1;
    procedure ADR_STREET_1_to_0;
    procedure ADR_STREET_0_to_1;
    procedure ADR_ADRESS_MAIN_1_to_0;
    procedure ADR_ADRESS_MAIN_0_to_1;
    procedure PEOPLE_1_to_0;
    procedure PEOPLE_0_to_1;
    procedure PASS_DATA_1_to_0;
    procedure PASS_DATA_0_to_1;
    procedure N_STRAN_2_to_0;
    procedure N_STRAN_0_to_2;
    procedure CITY_2_to_0;
    procedure CITY_0_to_2;
    procedure STREET_2_to_0;
    procedure STREET_0_to_2;
    procedure S_TERRIT_2_to_0;
    procedure S_TERRIT_0_to_2;
    procedure N_PASP_2_to_0;
    procedure N_PASP_0_to_2;
    procedure SaveLog(id_server,id_action,id_hst_on_server:Int64; emsg: string);
    procedure begin_global_local(exch_app_ProcName,S_Query,app_ProcName: string);
    procedure in_for_global_local(id_hst_field_name: string; id_server,id_action,id_hst_on_server:Int64);
    procedure begin_local_global(S_ProcName,exch_IU_ProcName: string; id_server: integer);
    procedure in_for_local_global(j_app_I_ProcName,id_ref_I_ProcName,id_field_name: string; id_server: integer);
    procedure begin_global_local2(exch_app_ProcName,S_Query,app_ProcName: string);
    procedure in_for_global_local2(id_hst_field_name: string; id_hst_on_server: Int64);
    procedure begin_local_global2(S_ProcName,exch_IU_ProcName: string; id_server: integer);
    procedure in_for_local_global2(j_app_I_ProcName,id_ref_I_ProcName,id_field_name: string; id_server: integer);
    procedure PEOPLE_2_to_0;
    procedure PEOPLE_0_to_2;
  public
    Log_Msg: string;
    procedure Synchronize_People;
    function GetPeopleID(id_men, id_server_in, id_server_out: int64): int64;
  end;

var
  DM_IE: TDM_IE;

implementation

{$R *.dfm}

procedure TDM_IE.SaveLog(id_server,id_action,id_hst_on_server:Int64; emsg: string);
begin
  Log_Msg := Log_Msg + 'id_server='+inttostr(id_server)+',id_action='+inttostr(id_action)+
        ',id_hst_on_server='+inttostr(id_hst_on_server)+#13#10+emsg+#13#10
//  showmessage('id_server='+inttostr(id_server)+',id_action='+inttostr(id_action)+',id_hst_on_server='+inttostr(id_hst_on_server)+#13#10+emsg);
end;

function TDM_IE.GetPeopleID(id_men, id_server_in, id_server_out: int64): int64;
begin
  with GetPeopleID_dset do
  begin
    Close;
    Parameters.ParamByName('@id_men').Value := id_men;
    Parameters.ParamByName('@id_server_in').Value := id_server_in;
    Parameters.ParamByName('@id_server_out').Value := id_server_out;
    Parameters.ParamByName('@id_men_out').Value := -1;
    ExecProc;
    if (VarIsNull(Parameters.ParamByName('@id_men_out').Value)) then
      GetPeopleID := -777
    else
    GetPeopleID := Parameters.ParamByName('@id_men_out').Value;
    Close;
  end;
end;

procedure TDM_IE.Synchronize_People;
var  cl: TClipboard;
begin
  //showmessage('Deny');
  exit;
  //showmessage('Deny');
  Log_Msg := '';
  INI_TYPE_PLACE_1_to_0;
  INI_TYPE_REGION_1_to_0;
  INI_TYPE_STREET_1_to_0;
  INI_TYPE_DISTRICT_1_to_0;
  PUB_INI_PASS_TYPE_1_to_0;
  ADR_COUNTRY_1_to_0;
  ADR_REGION_1_to_0;
  ADR_DISTRICT_1_to_0;
  ADR_PLACE_1_to_0;
  ADR_CITY_AREA_1_to_0;
  ADR_STREET_1_to_0;
  ADR_ADRESS_MAIN_1_to_0;
  PEOPLE_1_to_0;
  PASS_DATA_1_to_0;
  //------------------------------------
  N_STRAN_2_to_0;
  CITY_2_to_0;
  STREET_2_to_0;
  S_TERRIT_2_to_0;
  N_PASP_2_to_0;
  PEOPLE_2_to_0;
//------------------------------------
  INI_TYPE_PLACE_0_to_1;
  INI_TYPE_REGION_0_to_1;
  INI_TYPE_STREET_0_to_1;
  INI_TYPE_DISTRICT_0_to_1;
  PUB_INI_PASS_TYPE_0_to_1;
  ADR_COUNTRY_0_to_1;
  ADR_REGION_0_to_1;
  ADR_DISTRICT_0_to_1;
  ADR_PLACE_0_to_1;
  ADR_CITY_AREA_0_to_1;
  ADR_STREET_0_to_1;
  ADR_ADRESS_MAIN_0_to_1;
  PEOPLE_0_to_1;
  PASS_DATA_0_to_1;
  //------------------------------------
  N_STRAN_0_to_2;
  CITY_0_to_2;
  STREET_0_to_2;
  S_TERRIT_0_to_2;
  N_PASP_0_to_2;
  PEOPLE_0_to_2;
  if (Log_Msg <> '') then
  begin
 //   showmessage('Есть ошибки при синхронизации');
    cl:=Clipboard();
    cl.Clear;
    cl.AsText := Log_Msg;
  end
end;

procedure TDM_IE.begin_global_local(exch_app_ProcName,S_Query,app_ProcName: string);
begin
  exch_app_dset.Close;
  exch_app_dset.ProcedureName := exch_app_ProcName;
  exch_app_dset.Parameters.Refresh;
//----------------------------------------------------
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SQLs.SelectSQL.Text := S_Query;
  ReadDataSet.CloseOpen(false);
  ReadDataSet.FetchAll;
  ReadDataSet.First;
//----------------------------------------------------
  StProc.StoredProcName:=app_ProcName;
end;

procedure TDM_IE.begin_global_local2(exch_app_ProcName,S_Query,app_ProcName: string);
begin
  exch_app_dset.Close;
  exch_app_dset.ProcedureName := exch_app_ProcName;
  exch_app_dset.Parameters.Refresh;
//----------------------------------------------------
  SQ_dset.Close;
  SQ_dset.ProcedureName := S_Query;
  SQ_dset.Parameters.Refresh;
  SQ_dset.ExecProc;
  if (not SQ_dset.Active) then SQ_dset.Open;
  SQ_dset.First;
//----------------------------------------------------
  app_dset.Close;
  app_dset.ProcedureName := app_ProcName;
  app_dset.Parameters.Refresh;
end;

procedure TDM_IE.in_for_global_local(id_hst_field_name: string; id_server,id_action,id_hst_on_server:Int64);
var s: string;
begin
  try
    if (not GlobalDataRW.InTransaction) then GlobalDataRW.BeginTrans;
    exch_app_dset.Parameters.ParamByName('@id_hst_on_server').Value := id_hst_on_server;
    exch_app_dset.ExecProc;

    StProc.Params.ParamByName(id_hst_field_name).AsInt64 := id_hst_on_server;
    StProc.Transaction.StartTransaction;
    StProc.ExecProc;
    StProc.Transaction.Commit;
    GlobalDataRW.CommitTrans;
  except on e: Exception do
    begin
      s:= StProc.SQL.Text + ',' + exch_app_dset.ProcedureName;

      SaveLog(1, id_action, id_hst_on_server, s + #13#10 + e.Message);
      if (GlobalDataRW.InTransaction) then GlobalDataRW.RollbackTrans;
      if (StProc.Transaction.Active) then StProc.Transaction.Rollback;
    end;
  end;
end;

procedure TDM_IE.in_for_global_local2(id_hst_field_name: string; id_hst_on_server: Int64);
var s: string;
begin
  try
    if (not GlobalDataRW.InTransaction) then GlobalDataRW.BeginTrans;
    exch_app_dset.Parameters.ParamByName('@id_hst_on_server').Value := id_hst_on_server;
    exch_app_dset.ExecProc;

    if (not AmodelkaRW.InTransaction) then AmodelkaRW.BeginTrans;
    app_dset.Parameters.ParamByName(id_hst_field_name).Value := id_hst_on_server;
    app_dset.ExecProc;
    AmodelkaRW.CommitTrans;
    GlobalDataRW.CommitTrans;
  except on e: Exception do
    begin
      s:= app_dset.ProcedureName + ',' + exch_app_dset.ProcedureName;

      SaveLog(2, -1, id_hst_on_server, s + #13#10 + e.Message);
      if (GlobalDataRW.InTransaction) then GlobalDataRW.RollbackTrans;
      if (AmodelkaRW.InTransaction) then AmodelkaRW.RollbackTrans;
    end;
  end;
end;

procedure TDM_IE.begin_local_global(S_ProcName,exch_IU_ProcName: string; id_server: integer);
begin
  S_dset.Close;
  S_dset.ProcedureName := S_ProcName;
  S_dset.Parameters.Refresh;
  S_dset.Parameters.ParamByName('@id_server').Value := id_server;
  //----------------------------------------------------
  StProc.StoredProcName:=exch_IU_ProcName;
  //----------------------------------------------------
  S_dset.ExecProc;
  S_dset.Open;
  S_dset.First;
end;

procedure TDM_IE.begin_local_global2(S_ProcName,exch_IU_ProcName: string; id_server: integer);
begin
  S_dset.Close;
  S_dset.ProcedureName := S_ProcName;
  S_dset.Parameters.Refresh;
  S_dset.Parameters.ParamByName('@id_server').Value := id_server;
  //----------------------------------------------------
  exch_IU_dset.Close;
  exch_IU_dset.ProcedureName := exch_IU_ProcName;
  exch_IU_dset.Parameters.Refresh;
  //----------------------------------------------------
  S_dset.ExecProc;
  if (not S_dset.Active) then S_dset.Open;
  S_dset.First;
end;

procedure TDM_IE.in_for_local_global(j_app_I_ProcName,id_ref_I_ProcName,id_field_name: string; id_server: integer);
var s: string;
begin
  try
    StProc.Transaction.StartTransaction;
    if (not GlobalDataRW.InTransaction) then GlobalDataRW.BeginTrans;
    StProc.ExecProc;

    with j_app_I_dset do
    begin
      Close;
      ProcedureName := j_app_I_ProcName;
      Parameters.Refresh;
      Parameters.ParamByName('@id_global').Value := S_dset.FieldValues['id_global']; //S_dset.FieldValues[id_field_name];
      Parameters.ParamByName('@id_server').Value := id_server;
      ExecProc;
    end;

    with id_ref_I_dset do
    begin
      Close;
      ProcedureName := id_ref_I_ProcName;
      Parameters.Refresh;
      Parameters.ParamByName('@id_global').Value := S_dset.FieldValues['id_global'];
      Parameters.ParamByName('@id_system').Value := StProc.FieldByName('id_rec').AsInt64;
      Parameters.ParamByName('@id_server').Value := id_server;
      ExecProc;
    end;
    StProc.Transaction.Commit;
    GlobalDataRW.CommitTrans;
  except on e: Exception do
    begin
      s:= StProc.SQL.Text + ',' + j_app_I_ProcName + ',' + id_ref_I_ProcName + ': ' +
        'id_server = ' + inttostr(id_server) + ', ' +
        'id_global = ' + inttostr(S_dset.FieldValues['id_global']) + ', ';

        if (VarIsNull(S_dset.FieldValues[id_field_name])) then
          s := s + id_field_name + ' = NULL'
        else
          s := s + id_field_name + ' = ' + inttostr(S_dset.FieldValues[id_field_name]) + ', ';

        if (StProc.FieldByName('id_rec').IsNull) then
          s := s + 'id_system = NULL'
        else
          s := s + 'id_system = ' + inttostr(StProc.FieldByName('id_rec').AsInt64) + ', ';

      SaveLog(-1, -1, -1, s + #13#10 + e.Message);
      if (GlobalDataRW.InTransaction) then GlobalDataRW.RollbackTrans;
      if (StProc.Transaction.Active) then StProc.Transaction.Rollback;
    end;
  end;
end;

procedure TDM_IE.in_for_local_global2(j_app_I_ProcName,id_ref_I_ProcName,id_field_name: string; id_server: integer);
var s: string;
begin
  try
    if (not AmodelkaRW.InTransaction) then AmodelkaRW.BeginTrans;
    if (not GlobalDataRW.InTransaction) then GlobalDataRW.BeginTrans;
    exch_IU_dset.ExecProc;

    with j_app_I_dset do
    begin
      Close;
      ProcedureName := j_app_I_ProcName;
      Parameters.Refresh;
      Parameters.ParamByName('@id_global').Value := S_dset.FieldValues['id_global']; //S_dset.FieldValues[id_field_name];
      Parameters.ParamByName('@id_server').Value := id_server;
      ExecProc;
    end;

    with id_ref_I_dset do
    begin
      Close;
      ProcedureName := id_ref_I_ProcName;
      Parameters.Refresh;
      Parameters.ParamByName('@id_global').Value := S_dset.FieldValues['id_global'];
      Parameters.ParamByName('@id_system').Value := exch_IU_dset.Parameters.ParamValues['@id_rec'];
      Parameters.ParamByName('@id_server').Value := id_server;
      ExecProc;
    end;
    AmodelkaRW.CommitTrans;
    GlobalDataRW.CommitTrans;
  except on e: Exception do
    begin
      s:= exch_IU_dset.ProcedureName + ',' + j_app_I_ProcName + ',' + id_ref_I_ProcName + ': ' +
        'id_server = ' + inttostr(id_server) + ', ' +
        'id_global = ' + inttostr(S_dset.FieldValues['id_global']) + ', ';

        if (VarIsNull(S_dset.FieldValues[id_field_name])) then
          s := s + id_field_name + ' = NULL'
        else
          s := s + id_field_name + ' = ' + inttostr(S_dset.FieldValues[id_field_name]) + ', ';

        if (VarIsNull(exch_IU_dset.Parameters.ParamValues['@id_rec'])) then
          s := s + 'id_system = NULL'
        else
          s := s + 'id_system = ' + inttostr(exch_IU_dset.Parameters.ParamValues['@id_rec']);

      SaveLog(-1, -1, -1, s + #13#10 + e.Message);
      if (GlobalDataRW.InTransaction) then GlobalDataRW.RollbackTrans;
      if (AmodelkaRW.InTransaction) then AmodelkaRW.RollbackTrans;
    end;
  end;
end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.INI_TYPE_PLACE_1_to_0;
var i: integer;
  id_server,id_action,id_hst_on_server: Int64;
begin
  id_action := -100;
  id_hst_on_server := -100;

	try
    begin_global_local('Adres.G_sp_adres_naseleniy_punkt_type_exch_app',
                       'Select * from EXCH_INI_TYPE_PLACE_S',
                       'EXCH_INI_TYPE_PLACE_APP');

    for i:= 0 to ReadDataSet.RecordCount-1 do
    begin
      id_action := ReadDataSet['id_action'];
      id_hst_on_server := ReadDataSet['id_ini_type_place_hst'];
      //----------------------------------------------------
      if (id_action = -1) then SaveLog(1, id_action, id_hst_on_server, '')
      else
      begin
        with exch_app_dset.Parameters do
        begin
          ParamByName('@id_naseleniy_punkt_type').Value := ReadDataSet['id_type_place'];
          ParamByName('@full_name_naseleniy_punkt_type').Value := ReadDataSet['name_full'];
          ParamByName('@short_name_naseleniy_punkt_type').Value := ReadDataSet['name_short'];
          //----------------------------------------------------
          ParamByName('@id_server').Value := 1;
          ParamByName('@use_beg').Value := ReadDataSet['use_beg'];
          ParamByName('@use_end').Value := ReadDataSet['use_end'];
          ParamByName('@id_history_info').Value := ReadDataSet['id_history_info'];
          ParamByName('@id_action').Value := id_action;
          ParamByName('@is_applied').Value := ReadDataSet['is_applied'];
          ParamByName('@is_exchanged').Value := ReadDataSet['is_exchanged'];
          //----------------------------------------------------
          ParamByName('@chg_full_name_naseleniy_punkt_type').Value := ReadDataSet['chg_name_full'];
          ParamByName('@chg_short_name_naseleniy_punkt_type').Value := ReadDataSet['chg_name_short'];
        end;

        in_for_global_local('id_ini_type_place_hst',1,id_action,id_hst_on_server);
      end;

      ReadDataSet.Next;
    end;
    exch_app_dset.Close;
    ReadDataSet.Close;
	except on e: Exception do SaveLog(1, id_action, id_hst_on_server, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.INI_TYPE_REGION_1_to_0;
var i: integer;
  id_server,id_action,id_hst_on_server: Int64;
begin
  id_action := -100;
  id_hst_on_server := -100;

	try
    begin_global_local('Adres.G_sp_adres_oblast_type_exch_app',
                       'Select * from EXCH_INI_TYPE_REGION_S',
                       'EXCH_INI_TYPE_REGION_APP');

    for i:= 0 to ReadDataSet.RecordCount-1 do
    begin
      id_action := ReadDataSet['id_action'];
      id_hst_on_server := ReadDataSet['id_ini_type_region_hst'];
      //----------------------------------------------------
      if (id_action = -1) then SaveLog(1, id_action, id_hst_on_server, '')
      else
      begin
        with exch_app_dset.Parameters do
        begin
          ParamByName('@id_oblast_type').Value := ReadDataSet['id_region_type'];
          ParamByName('@full_name_oblast_type').Value := ReadDataSet['name_full'];
          ParamByName('@short_name_oblast_type').Value := ReadDataSet['name_short'];
          //----------------------------------------------------
          ParamByName('@id_hst_on_server').Value := id_hst_on_server;
          ParamByName('@id_server').Value := 1;
          ParamByName('@use_beg').Value := ReadDataSet['use_beg'];
          ParamByName('@use_end').Value := ReadDataSet['use_end'];
          ParamByName('@id_history_info').Value := ReadDataSet['id_history_info'];
          ParamByName('@id_action').Value := id_action;
          ParamByName('@is_applied').Value := ReadDataSet['is_applied'];
          ParamByName('@is_exchanged').Value := ReadDataSet['is_exchanged'];
          //----------------------------------------------------
          ParamByName('@chg_full_name_oblast_type').Value := ReadDataSet['chg_name_full'];
          ParamByName('@chg_short_name_oblast_type').Value := ReadDataSet['chg_name_short'];
        end;

        in_for_global_local('id_ini_type_region_hst',1,id_action,id_hst_on_server);
      end;

      ReadDataSet.Next;
    end;
    exch_app_dset.Close;
    ReadDataSet.Close;
	except on e: Exception do SaveLog(1, id_action, id_hst_on_server, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.INI_TYPE_STREET_1_to_0;
var i: integer;
  id_server,id_action,id_hst_on_server: Int64;
begin
  id_action := -100;
  id_hst_on_server := -100;

	try
    begin_global_local('Adres.G_sp_adres_ulici_type_exch_app',
                       'Select * from EXCH_INI_TYPE_STREET_S',
                       'EXCH_INI_TYPE_STREET_APP');

    for i:= 0 to ReadDataSet.RecordCount-1 do
    begin
      id_action := ReadDataSet['id_action'];
      id_hst_on_server := ReadDataSet['id_ini_type_street_hst'];
      //----------------------------------------------------
      if (id_action = -1) then SaveLog(1, id_action, id_hst_on_server, '')
      else
      begin
        with exch_app_dset.Parameters do
        begin
          ParamByName('@id_ulici_type').Value := ReadDataSet['id_type_street'];
          ParamByName('@full_name_ulici_type').Value := ReadDataSet['name_full'];
          ParamByName('@short_name_ulici_type').Value := ReadDataSet['name_short'];
          //----------------------------------------------------
          ParamByName('@id_hst_on_server').Value := id_hst_on_server;
          ParamByName('@id_server').Value := 1;
          ParamByName('@use_beg').Value := ReadDataSet['use_beg'];
          ParamByName('@use_end').Value := ReadDataSet['use_end'];
          ParamByName('@id_history_info').Value := ReadDataSet['id_history_info'];
          ParamByName('@id_action').Value := id_action;
          ParamByName('@is_applied').Value := ReadDataSet['is_applied'];
          ParamByName('@is_exchanged').Value := ReadDataSet['is_exchanged'];
          //----------------------------------------------------
          ParamByName('@chg_full_name_ulici_type').Value := ReadDataSet['chg_name_full'];
          ParamByName('@chg_short_name_ulici_type').Value := ReadDataSet['chg_name_short'];
        end;

        in_for_global_local('id_ini_type_street_hst',1,id_action,id_hst_on_server);
      end;

      ReadDataSet.Next;
    end;
    exch_app_dset.Close;
    ReadDataSet.Close;
	except on e: Exception do SaveLog(1, id_action, id_hst_on_server, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.INI_TYPE_DISTRICT_1_to_0;
var i: integer;
  id_server,id_action,id_hst_on_server: Int64;
begin
  id_action := -100;
  id_hst_on_server := -100;

	try
    begin_global_local('Adres.G_sp_adres_admin_rayon_type_exch_app',
                       'Select * from EXCH_INI_TYPE_DISTRICT_S',
                       'EXCH_INI_TYPE_DISTRICT_APP');

    for i:= 0 to ReadDataSet.RecordCount-1 do
    begin
      id_action := ReadDataSet['id_action'];
      id_hst_on_server := ReadDataSet['id_ini_type_district_hst'];
      //----------------------------------------------------
      if (id_action = -1) then SaveLog(1, id_action, id_hst_on_server, '')
      else
      begin
        with exch_app_dset.Parameters do
        begin
          ParamByName('@id_admin_rayon_type').Value := ReadDataSet['id_type_district'];
          ParamByName('@full_name_admin_rayon_type').Value := ReadDataSet['name_full'];
          ParamByName('@short_name_admin_rayon_type').Value := ReadDataSet['name_short'];
          //----------------------------------------------------
          ParamByName('@id_hst_on_server').Value := id_hst_on_server;
          ParamByName('@id_server').Value := 1;
          ParamByName('@use_beg').Value := ReadDataSet['use_beg'];
          ParamByName('@use_end').Value := ReadDataSet['use_end'];
          ParamByName('@id_history_info').Value := ReadDataSet['id_history_info'];
          ParamByName('@id_action').Value := id_action;
          ParamByName('@is_applied').Value := ReadDataSet['is_applied'];
          ParamByName('@is_exchanged').Value := ReadDataSet['is_exchanged'];
          //----------------------------------------------------
          ParamByName('@chg_full_name_admin_rayon_type').Value := ReadDataSet['chg_name_full'];
          ParamByName('@chg_short_name_admin_rayon_type').Value := ReadDataSet['chg_name_short'];
        end;

        in_for_global_local('id_ini_type_district_hst',1,id_action,id_hst_on_server);
      end;

      ReadDataSet.Next;
    end;
    exch_app_dset.Close;
    ReadDataSet.Close;
	except on e: Exception do SaveLog(1, id_action, id_hst_on_server, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.PUB_INI_PASS_TYPE_1_to_0;
var i: integer;
  id_server,id_action,id_hst_on_server: Int64;
begin
  id_action := -100;
  id_hst_on_server := -100;

	try
    begin_global_local('Person.G_sp_pasport_type_exch_app',
                       'Select * from EXCH_PUB_INI_PASS_TYPE_S',
                       'EXCH_PUB_INI_PASS_TYPE_APP');

    for i:= 0 to ReadDataSet.RecordCount-1 do
    begin
      id_action := ReadDataSet['id_action'];
      id_hst_on_server := ReadDataSet['id_pub_ini_pass_type_hst'];
      //----------------------------------------------------
      if (id_action = -1) then SaveLog(1, id_action, id_hst_on_server, '')
      else
      begin
        with exch_app_dset.Parameters do
        begin
          ParamByName('@id_pasport_type').Value := ReadDataSet['id_pass_type'];
          ParamByName('@Name_pasport_type').Value := ReadDataSet['pass_type_name'];
          //----------------------------------------------------
          ParamByName('@id_hst_on_server').Value := id_hst_on_server;
          ParamByName('@id_server').Value := 1;
          ParamByName('@use_beg').Value := ReadDataSet['use_beg'];
          ParamByName('@use_end').Value := ReadDataSet['use_end'];
          ParamByName('@id_history_info').Value := ReadDataSet['id_history_info'];
          ParamByName('@id_action').Value := id_action;
          ParamByName('@is_applied').Value := ReadDataSet['is_applied'];
          ParamByName('@is_exchanged').Value := ReadDataSet['is_exchanged'];
          //----------------------------------------------------
          ParamByName('@chg_Name_pasport_type').Value := ReadDataSet['chg_pass_type_name'];
        end;

        in_for_global_local('id_pub_ini_pass_type_hst',1,id_action,id_hst_on_server);
      end;

      ReadDataSet.Next;
    end;
    exch_app_dset.Close;
    ReadDataSet.Close;
	except on e: Exception do SaveLog(1, id_action, id_hst_on_server, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.ADR_COUNTRY_1_to_0;
var i: integer;
  id_server,id_action,id_hst_on_server: Int64;
begin
  id_action := -100;
  id_hst_on_server := -100;

	try
    begin_global_local('Adres.G_dt_adres_strana_exch_app',
                       'Select * from EXCH_ADR_COUNTRY_S',
                       'EXCH_ADR_COUNTRY_APP');

    for i:= 0 to ReadDataSet.RecordCount-1 do
    begin
      id_action := ReadDataSet['id_action'];
      id_hst_on_server := ReadDataSet['id_adr_country_hst'];
      //----------------------------------------------------
      if (id_action = -1) then SaveLog(1, id_action, id_hst_on_server, '')
      else
      begin
        with exch_app_dset.Parameters do
        begin
          ParamByName('@id_strana').Value := ReadDataSet['id_country'];
          ParamByName('@name_strana').Value := ReadDataSet['name_country'];
          //----------------------------------------------------
          ParamByName('@id_hst_on_server').Value := id_hst_on_server;
          ParamByName('@id_server').Value := 1;
          ParamByName('@use_beg').Value := ReadDataSet['use_beg'];
          ParamByName('@use_end').Value := ReadDataSet['use_end'];
          ParamByName('@id_history_info').Value := ReadDataSet['id_history_info'];
          ParamByName('@id_action').Value := id_action;
          ParamByName('@is_applied').Value := ReadDataSet['is_applied'];
          ParamByName('@is_exchanged').Value := ReadDataSet['is_exchanged'];
          //----------------------------------------------------
          ParamByName('@chg_name_strana').Value := ReadDataSet['chg_name_country'];
        end;

        in_for_global_local('id_adr_country_hst',1,id_action,id_hst_on_server);
      end;

      ReadDataSet.Next;
    end;
    exch_app_dset.Close;
    ReadDataSet.Close;
	except on e: Exception do SaveLog(1, id_action, id_hst_on_server, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.ADR_REGION_1_to_0;
var i: integer;
  id_server,id_action,id_hst_on_server: Int64;
begin
  id_action := -100;
  id_hst_on_server := -100;

	try
    begin_global_local('Adres.G_dt_adres_oblast_exch_app',
                       'Select * from EXCH_ADR_REGION_S',
                       'EXCH_ADR_REGION_APP');

    for i:= 0 to ReadDataSet.RecordCount-1 do
    begin
      id_action := ReadDataSet['id_action'];
      id_hst_on_server := ReadDataSet['id_adr_region_hst'];
      //----------------------------------------------------
      if (id_action = -1) then SaveLog(1, id_action, id_hst_on_server, '')
      else
      begin
        with exch_app_dset.Parameters do
        begin
          ParamByName('@id_oblast').Value := ReadDataSet['id_region'];
          ParamByName('@id_strana').Value := ReadDataSet['id_country'];
          ParamByName('@id_oblast_type').Value := ReadDataSet['id_region_type'];
          ParamByName('@name_oblast').Value := ReadDataSet['name_region'];
          ParamByName('@on_read_only').Value := ReadDataSet['is_read_only'];
          ParamByName('@on_ustarelo').Value := ReadDataSet['is_old'];
          //----------------------------------------------------
          ParamByName('@id_hst_on_server').Value := id_hst_on_server;
          ParamByName('@id_server').Value := 1;
          ParamByName('@use_beg').Value := ReadDataSet['use_beg'];
          ParamByName('@use_end').Value := ReadDataSet['use_end'];
          ParamByName('@id_history_info').Value := ReadDataSet['id_history_info'];
          ParamByName('@id_action').Value := id_action;
          ParamByName('@is_applied').Value := ReadDataSet['is_applied'];
          ParamByName('@is_exchanged').Value := ReadDataSet['is_exchanged'];
          //----------------------------------------------------
          ParamByName('@chg_id_strana').Value := ReadDataSet['chg_id_country'];
          ParamByName('@chg_id_oblast_type').Value := ReadDataSet['chg_id_region_type'];
          ParamByName('@chg_name_oblast').Value := ReadDataSet['chg_name_region'];
          ParamByName('@chg_on_read_only').Value := ReadDataSet['chg_is_read_only'];
          ParamByName('@chg_on_ustarelo').Value := ReadDataSet['chg_is_old'];
        end;

        in_for_global_local('id_adr_region_hst',1,id_action,id_hst_on_server);
      end;

      ReadDataSet.Next;
    end;
    exch_app_dset.Close;
    ReadDataSet.Close;
	except on e: Exception do SaveLog(1, id_action, id_hst_on_server, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.ADR_DISTRICT_1_to_0;
var i: integer;
  id_server,id_action,id_hst_on_server: Int64;
begin
  id_action := -100;
  id_hst_on_server := -100;

	try
    begin_global_local('Adres.G_dt_adres_admin_rayon_exch_app',
                       'Select * from EXCH_ADR_DISTRICT_S',
                       'EXCH_ADR_DISTRICT_APP');

    for i:= 0 to ReadDataSet.RecordCount-1 do
    begin
      id_action := ReadDataSet['id_action'];
      id_hst_on_server := ReadDataSet['id_adr_district_hst'];
      //----------------------------------------------------
      if (id_action = -1) then SaveLog(1, id_action, id_hst_on_server, '')
      else
      begin
        with exch_app_dset.Parameters do
        begin
          ParamByName('@id_admin_rayon').Value := ReadDataSet['id_district'];
          ParamByName('@id_oblast').Value := ReadDataSet['id_region'];
          ParamByName('@name_admin_rayon').Value := ReadDataSet['name_district'];
          ParamByName('@on_read_only').Value := ReadDataSet['is_read_only'];
          ParamByName('@on_ustarelo').Value := ReadDataSet['is_old'];
         //----------------------------------------------------
          ParamByName('@id_hst_on_server').Value := id_hst_on_server;
          ParamByName('@id_server').Value := 1;
          ParamByName('@use_beg').Value := ReadDataSet['use_beg'];
          ParamByName('@use_end').Value := ReadDataSet['use_end'];
          ParamByName('@id_history_info').Value := ReadDataSet['id_history_info'];
          ParamByName('@id_action').Value := id_action;
          ParamByName('@is_applied').Value := ReadDataSet['is_applied'];
          ParamByName('@is_exchanged').Value := ReadDataSet['is_exchanged'];
          //----------------------------------------------------
          ParamByName('@chg_id_oblast').Value := ReadDataSet['chg_id_region'];
          ParamByName('@chg_name_admin_rayon').Value := ReadDataSet['chg_name_district'];
          ParamByName('@chg_on_read_only').Value := ReadDataSet['chg_is_read_only'];
          ParamByName('@chg_on_ustarelo').Value := ReadDataSet['chg_is_old'];
        end;

        in_for_global_local('id_adr_district_hst',1,id_action,id_hst_on_server);
      end;

      ReadDataSet.Next;
    end;
    exch_app_dset.Close;
    ReadDataSet.Close;
	except on e: Exception do SaveLog(1, id_action, id_hst_on_server, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.ADR_PLACE_1_to_0;
var i: integer;
  id_server,id_action,id_hst_on_server: Int64;
begin
  id_action := -100;
  id_hst_on_server := -100;

	try
    begin_global_local('Adres.G_dt_adres_naseleniy_punkt_exch_app',
                       'Select * from EXCH_ADR_PLACE_S',
                       'EXCH_ADR_PLACE_APP');

    for i:= 0 to ReadDataSet.RecordCount-1 do
    begin
      id_action := ReadDataSet['id_action'];
      id_hst_on_server := ReadDataSet['id_adr_place_hst'];
      //----------------------------------------------------
      if (id_action = -1) then SaveLog(1, id_action, id_hst_on_server, '')
      else
      begin
        with exch_app_dset.Parameters do
        begin
          ParamByName('@id_naseleniy_punkt').Value := ReadDataSet['id_place'];
          ParamByName('@id_oblast').Value := ReadDataSet['id_region'];
          ParamByName('@id_admin_rayon').Value := ReadDataSet['id_district'];
          ParamByName('@id_naseleniy_punkt_type').Value := ReadDataSet['id_place_type'];
          ParamByName('@name_naseleniy_punkt').Value := ReadDataSet['name_place'];
          ParamByName('@post_index').Value := ReadDataSet['zipcode'];
          ParamByName('@on_read_only').Value := ReadDataSet['is_read_only'];
          ParamByName('@on_ustarelo').Value := ReadDataSet['is_old'];
         //----------------------------------------------------
          ParamByName('@id_hst_on_server').Value := id_hst_on_server;
          ParamByName('@id_server').Value := 1;
          ParamByName('@use_beg').Value := ReadDataSet['use_beg'];
          ParamByName('@use_end').Value := ReadDataSet['use_end'];
          ParamByName('@id_history_info').Value := ReadDataSet['id_history_info'];
          ParamByName('@id_action').Value := id_action;
          ParamByName('@is_applied').Value := ReadDataSet['is_applied'];
          ParamByName('@is_exchanged').Value := ReadDataSet['is_exchanged'];
          //----------------------------------------------------
          ParamByName('@chg_id_oblast').Value := ReadDataSet['chg_id_region'];
          ParamByName('@chg_id_admin_rayon').Value := ReadDataSet['chg_id_district'];
          ParamByName('@chg_id_naseleniy_punkt_type').Value := ReadDataSet['chg_id_place_type'];
          ParamByName('@chg_name_naseleniy_punkt').Value := ReadDataSet['chg_name_place'];
          ParamByName('@chg_post_index').Value := ReadDataSet['chg_zipcode'];
          ParamByName('@chg_on_read_only').Value := ReadDataSet['chg_is_read_only'];
          ParamByName('@chg_on_ustarelo').Value := ReadDataSet['chg_is_old'];
        end;

        in_for_global_local('id_adr_place_hst',1,id_action,id_hst_on_server);
      end;

      ReadDataSet.Next;
    end;
    exch_app_dset.Close;
    ReadDataSet.Close;
	except on e: Exception do SaveLog(1, id_action, id_hst_on_server, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.ADR_CITY_AREA_1_to_0;
var i: integer;
  id_server,id_action,id_hst_on_server: Int64;
begin
  id_action := -100;
  id_hst_on_server := -100;

	try
    begin_global_local('Adres.G_dt_adres_gorodskoy_rayon_exch_app',
                       'Select * from EXCH_ADR_CITY_AREA_S',
                       'EXCH_ADR_CITY_AREA_APP');

    for i:= 0 to ReadDataSet.RecordCount-1 do
    begin
      id_action := ReadDataSet['id_action'];
      id_hst_on_server := ReadDataSet['id_adr_city_area_hist'];
      //----------------------------------------------------
      if (id_action = -1) then SaveLog(1, id_action, id_hst_on_server, '')
      else
      begin
        with exch_app_dset.Parameters do
        begin
          ParamByName('@id_gorodskoy_rayon').Value := ReadDataSet['id_city_area'];
          ParamByName('@id_naseleniy_punkt').Value := ReadDataSet['id_place'];
          ParamByName('@name_rayon').Value := ReadDataSet['name_city_area'];
          ParamByName('@on_ustarelo').Value := ReadDataSet['is_old'];
         //----------------------------------------------------
          ParamByName('@id_hst_on_server').Value := id_hst_on_server;
          ParamByName('@id_server').Value := 1;
          ParamByName('@use_beg').Value := ReadDataSet['use_beg'];
          ParamByName('@use_end').Value := ReadDataSet['use_end'];
          ParamByName('@id_history_info').Value := ReadDataSet['id_history_info'];
          ParamByName('@id_action').Value := id_action;
          ParamByName('@is_applied').Value := ReadDataSet['is_applied'];
          ParamByName('@is_exchanged').Value := ReadDataSet['is_exchanged'];
          //----------------------------------------------------
          ParamByName('@chg_id_naseleniy_punkt').Value := ReadDataSet['chg_id_place'];
          ParamByName('@chg_name_rayon').Value := ReadDataSet['chg_name_city_area'];
          ParamByName('@chg_on_ustarelo').Value := ReadDataSet['chg_is_old'];
        end;

        in_for_global_local('id_adr_city_area_hist',1,id_action,id_hst_on_server);
      end;

      ReadDataSet.Next;
    end;
    exch_app_dset.Close;
    ReadDataSet.Close;
	except on e: Exception do SaveLog(1, id_action, id_hst_on_server, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.ADR_STREET_1_to_0;
var i: integer;
  id_server,id_action,id_hst_on_server: Int64;
begin
  id_action := -100;
  id_hst_on_server := -100;

	try
    begin_global_local('Adres.G_dt_adres_ulici_exch_app',
                       'Select * from EXCH_ADR_STREET_S',
                       'EXCH_ADR_STREET_APP');

    for i:= 0 to ReadDataSet.RecordCount-1 do
    begin
      id_action := ReadDataSet['id_action'];
      id_hst_on_server := ReadDataSet['ID_ADR_STREET_HST'];
      //----------------------------------------------------
      if (id_action = -1) then SaveLog(1, id_action, id_hst_on_server, '')
      else
      begin
        with exch_app_dset.Parameters do
        begin
          ParamByName('@id_ulici').Value := ReadDataSet['id_street'];
          ParamByName('@id_naseleniy_punkt').Value := ReadDataSet['id_place'];
          ParamByName('@id_ulici_type').Value := ReadDataSet['id_type_street'];
          ParamByName('@name_ulica').Value := ReadDataSet['name_street'];
          ParamByName('@on_ustarelo').Value := ReadDataSet['is_old'];
        //----------------------------------------------------
          ParamByName('@id_hst_on_server').Value := id_hst_on_server;
          ParamByName('@id_server').Value := 1;
          ParamByName('@use_beg').Value := ReadDataSet['use_beg'];
          ParamByName('@use_end').Value := ReadDataSet['use_end'];
          ParamByName('@id_history_info').Value := ReadDataSet['id_history_info'];
          ParamByName('@id_action').Value := id_action;
          ParamByName('@is_applied').Value := ReadDataSet['is_applied'];
          ParamByName('@is_exchanged').Value := ReadDataSet['is_exchanged'];
          //----------------------------------------------------
          ParamByName('@chg_id_naseleniy_punkt').Value := ReadDataSet['chg_id_place'];
          ParamByName('@chg_id_ulici_type').Value := ReadDataSet['chg_id_type_street'];
          ParamByName('@chg_name_ulica').Value := ReadDataSet['chg_name_street'];
          ParamByName('@chg_on_ustarelo').Value := ReadDataSet['chg_is_old'];
        end;

        in_for_global_local('ID_ADR_STREET_HST',1,id_action,id_hst_on_server);
      end;

      ReadDataSet.Next;
    end;
    exch_app_dset.Close;
    ReadDataSet.Close;
	except on e: Exception do SaveLog(1, id_action, id_hst_on_server, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.ADR_ADRESS_MAIN_1_to_0;
var i: integer;
  id_server,id_action,id_hst_on_server: Int64;
begin
  id_action := -100;
  id_hst_on_server := -100;

	try
    begin_global_local('Adres.G_dt_adres_main_exch_app',
                       'Select * from EXCH_ADR_ADRESS_MAIN_S',
                       'EXCH_ADR_ADRESS_MAIN_APP');

    for i:= 0 to ReadDataSet.RecordCount-1 do
    begin
      id_action := ReadDataSet['id_action'];
      id_hst_on_server := ReadDataSet['id_adr_adress_main_hist'];
      //----------------------------------------------------
      if (id_action = -1) then SaveLog(1, id_action, id_hst_on_server, '')
      else
      begin
        with exch_app_dset.Parameters do
        begin
          ParamByName('@id_adres').Value := ReadDataSet['id_adress'];
          ParamByName('@id_ulica').Value := ReadDataSet['id_street'];
          ParamByName('@post_index').Value := ReadDataSet['zipcode'];
          ParamByName('@id_rayon').Value := ReadDataSet['id_city_area'];
          ParamByName('@korpus').Value := ReadDataSet['korpus'];
          ParamByName('@dom').Value := ReadDataSet['house'];
          ParamByName('@kvartira').Value := ReadDataSet['flat'];
          ParamByName('@on_ustarelo').Value := 0;
        //----------------------------------------------------
          ParamByName('@id_hst_on_server').Value := id_hst_on_server;
          ParamByName('@id_server').Value := 1;
          ParamByName('@use_beg').Value := ReadDataSet['use_beg'];
          ParamByName('@use_end').Value := ReadDataSet['use_end'];
          ParamByName('@id_history_info').Value := ReadDataSet['id_history_info'];
          ParamByName('@id_action').Value := id_action;
          ParamByName('@is_applied').Value := ReadDataSet['is_applied'];
          ParamByName('@is_exchanged').Value := ReadDataSet['is_exchanged'];
          //----------------------------------------------------
          ParamByName('@chg_post_index').Value := ReadDataSet['chg_zipcode'];
          ParamByName('@chg_id_rayon').Value := ReadDataSet['chg_id_city_area'];
          ParamByName('@chg_id_ulica').Value := ReadDataSet['chg_id_street'];
          ParamByName('@chg_korpus').Value := ReadDataSet['chg_korpus'];
          ParamByName('@chg_dom').Value := ReadDataSet['chg_house'];
          ParamByName('@chg_kvartira').Value := ReadDataSet['chg_flat'];
          ParamByName('@chg_on_ustarelo').Value := 0;
        end;

        in_for_global_local('id_adr_adress_main_hist',1,id_action,id_hst_on_server);
      end;

      ReadDataSet.Next;
    end;
    exch_app_dset.Close;
    ReadDataSet.Close;
	except on e: Exception do SaveLog(1, id_action, id_hst_on_server, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.PEOPLE_1_to_0;
var i: integer;
  id_server,id_action,id_hst_on_server: Int64;
begin
  id_action := -100;
  id_hst_on_server := -100;

	try
    begin_global_local('Person.G_dt_fiz_lica_main_exch_app',
                       'Select * from EXCH_PEOPLE_S',
                       'EXCH_PEOPLE_APP');

    for i:= 0 to ReadDataSet.RecordCount-1 do
    begin
      id_action := ReadDataSet['id_action'];
      id_hst_on_server := ReadDataSet['id_people_history'];
      //----------------------------------------------------
      if (id_action = -1) then SaveLog(1, id_action, id_hst_on_server, '')
      else
      begin
        with exch_app_dset.Parameters do
        begin
          ParamByName('@id_fiz_lica').Value := ReadDataSet['id_man'];
          ParamByName('@nalog_kod').Value := ReadDataSet['tin'];
          ParamByName('@familiya_ukr').Value := ReadDataSet['familia'];
          ParamByName('@imya_ukr').Value := ReadDataSet['imya'];
          ParamByName('@otchestvo_ukr').Value := ReadDataSet['otchestvo'];
          ParamByName('@familiya_rus').Value := ReadDataSet['rus_familia'];
          ParamByName('@imya_rus').Value := ReadDataSet['rus_imya'];
          ParamByName('@otchestvo_rus').Value := ReadDataSet['rus_otchestvo'];
          ParamByName('@date_rogdeniya').Value := ReadDataSet['birth_date'];
          ParamByName('@pol').Value := ReadDataSet['id_sex'];
          ParamByName('@num_kartochki_socstrah').Value := ReadDataSet['soc_card_number'];
          ParamByName('@on_ustarelo').Value := ReadDataSet['is_old'];
          ParamByName('@id_nacionalnost').Value := null;
          ParamByName('@id_adres').Value := ReadDataSet['id_adress'];
          ParamByName('@id_mesto_rogden').Value := ReadDataSet['id_birth_place'];
          ParamByName('@id_strana').Value := ReadDataSet['id_country'];
      //----------------------------------------------------
          ParamByName('@id_hst_on_server').Value := id_hst_on_server;
          ParamByName('@id_server').Value := 1;
          ParamByName('@use_beg').Value := ReadDataSet['use_beg'];
          ParamByName('@use_end').Value := ReadDataSet['use_end'];
          ParamByName('@id_history_info').Value := ReadDataSet['id_history_info'];
          ParamByName('@id_action').Value := id_action;
          ParamByName('@is_applied').Value := ReadDataSet['is_applied'];
          ParamByName('@is_exchanged').Value := ReadDataSet['is_exchanged'];
          //----------------------------------------------------
          ParamByName('@chg_nalog_kod').Value := ReadDataSet['chg_tin'];
          ParamByName('@chg_familiya_ukr').Value := ReadDataSet['chg_familia'];
          ParamByName('@chg_imya_ukr').Value := ReadDataSet['chg_imya'];
          ParamByName('@chg_otchestvo_ukr').Value := ReadDataSet['chg_otchestvo'];
          ParamByName('@chg_familiya_rus').Value := ReadDataSet['chg_rus_familia'];
          ParamByName('@chg_imya_rus').Value := ReadDataSet['chg_rus_imya'];
          ParamByName('@chg_otchestvo_rus').Value := ReadDataSet['chg_rus_otchestvo'];
          ParamByName('@chg_date_rogdeniya').Value := ReadDataSet['chg_birth_date'];
          ParamByName('@chg_pol').Value := ReadDataSet['chg_id_sex'];
          ParamByName('@chg_num_kartochki_socstrah').Value := ReadDataSet['chg_soc_card_number'];
          ParamByName('@chg_on_ustarelo').Value := ReadDataSet['chg_is_old'];
          ParamByName('@chg_id_nacionalnost').Value := 0;
          ParamByName('@chg_id_adres').Value := ReadDataSet['chg_id_adress'];
          ParamByName('@chg_id_mesto_rogden').Value := ReadDataSet['chg_id_birth_place'];
          ParamByName('@chg_id_strana').Value := ReadDataSet['chg_id_country'];
        end;

        in_for_global_local('id_people_history',1,id_action,id_hst_on_server);
      end;

      ReadDataSet.Next;
    end;
    exch_app_dset.Close;
    ReadDataSet.Close;
	except on e: Exception do SaveLog(1, id_action, id_hst_on_server, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.PASS_DATA_1_to_0;
var i: integer;
  id_server,id_action,id_hst_on_server: Int64;
begin
  id_action := -100;
  id_hst_on_server := -100;

	try
    begin_global_local('Person.G_dt_pasport_exch_app',
                       'Select * from EXCH_PASS_DATA_S',
                       'EXCH_PASS_DATA_APP');

    for i:= 0 to ReadDataSet.RecordCount-1 do
    begin
      id_action := ReadDataSet['id_action'];
      id_hst_on_server := ReadDataSet['id_pass_data_history'];
      //----------------------------------------------------
      if (id_action = -1) then SaveLog(1, id_action, id_hst_on_server, '')
      else
      begin
        with exch_app_dset.Parameters do
        begin
          ParamByName('@id_pasport').Value := ReadDataSet['id_pas_data'];
          ParamByName('@id_pasport_type').Value := ReadDataSet['id_pass_type'];
          ParamByName('@id_fiz_lica').Value := ReadDataSet['id_man'];
          ParamByName('@seria').Value := ReadDataSet['seria'];
          ParamByName('@nomer').Value := ReadDataSet['number'];
          ParamByName('@familiya_ukr').Value := ReadDataSet['familia'];
          ParamByName('@imya_ukr').Value := ReadDataSet['imya'];
          ParamByName('@otchestvo_ukr').Value := ReadDataSet['otchestvo'];
          ParamByName('@familiya_rus').Value := ReadDataSet['rus_familia'];
          ParamByName('@imya_rus').Value := ReadDataSet['rus_imya'];
          ParamByName('@otchestvo_rus').Value := ReadDataSet['rus_otchestvo'];
          ParamByName('@vidan').Value := ReadDataSet['vidan'];
          ParamByName('@on_old_vidan').Value := ReadDataSet['is_old_vidan'];
          ParamByName('@date_beg').Value := ReadDataSet['date_beg'];
          ParamByName('@date_end').Value := ReadDataSet['date_end'];
        //----------------------------------------------------
          ParamByName('@id_hst_on_server').Value := id_hst_on_server;
          ParamByName('@id_server').Value := 1;
          ParamByName('@use_beg').Value := ReadDataSet['use_beg'];
          ParamByName('@use_end').Value := ReadDataSet['use_end'];
          ParamByName('@id_history_info').Value := ReadDataSet['id_history_info'];
          ParamByName('@id_action').Value := id_action;
          ParamByName('@is_applied').Value := ReadDataSet['is_applied'];
          ParamByName('@is_exchanged').Value := ReadDataSet['is_exchanged'];
          //----------------------------------------------------
          ParamByName('@chg_id_pasport_type').Value := ReadDataSet['chg_id_pass_type'];
          ParamByName('@chg_id_fiz_lica').Value := ReadDataSet['chg_id_man'];
          ParamByName('@chg_seria').Value := ReadDataSet['chg_seria'];
          ParamByName('@chg_nomer').Value := ReadDataSet['chg_number'];
          ParamByName('@chg_familiya_ukr').Value := ReadDataSet['chg_familia'];
          ParamByName('@chg_imya_ukr').Value := ReadDataSet['chg_imya'];
          ParamByName('@chg_otchestvo_ukr').Value := ReadDataSet['chg_otchestvo'];
          ParamByName('@chg_familiya_rus').Value := ReadDataSet['chg_rus_familia'];
          ParamByName('@chg_imya_rus').Value := ReadDataSet['chg_rus_imya'];
          ParamByName('@chg_otchestvo_rus').Value := ReadDataSet['chg_rus_otchestvo'];
          ParamByName('@chg_vidan').Value := ReadDataSet['chg_vidan'];
          ParamByName('@chg_on_old_vidan').Value := ReadDataSet['chg_is_old_vidan'];
          ParamByName('@chg_date_beg').Value := ReadDataSet['chg_date_beg'];
          ParamByName('@chg_date_end').Value := ReadDataSet['chg_date_end'];
        end;

        in_for_global_local('id_pass_data_history',1,id_action,id_hst_on_server);
      end;

      ReadDataSet.Next;
    end;
    exch_app_dset.Close;
    ReadDataSet.Close;
	except on e: Exception do SaveLog(1, id_action, id_hst_on_server, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.INI_TYPE_PLACE_0_to_1;
var i: integer;
  id_rec: Int64;
begin

  try
    begin_local_global('Adres.G_sp_adres_naseleniy_punkt_type_exch_S',
                       'EXCH_INI_TYPE_PLACE_IU',
                       1);

    with S_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
          if (VarIsNull(FieldValues['id_naseleniy_punkt_type'])) then
            StProc.ParamByName('id_type_place').IsNull := true
          else
            StProc.ParamByName('id_type_place').AsInt64 := FieldValues['id_naseleniy_punkt_type'];
          //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['full_name_naseleniy_punkt_type'])) then
            StProc.ParamByName('name_full').IsNull := true
          else
            StProc.ParamByName('name_full').AsString := FieldValues['full_name_naseleniy_punkt_type'];
          //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['short_name_naseleniy_punkt_type'])) then
            StProc.ParamByName('name_short').IsNull := true
          else
            StProc.ParamByName('name_short').AsString := FieldValues['short_name_naseleniy_punkt_type'];
          //-------------------------------------------------------------------------------------------------------
          StProc.ParamByName('dorder').AsInt64 := 100;

        in_for_local_global('Adres.G_sp_adres_naseleniy_punkt_type_j_app_I',
                            'Adres.G_sp_adres_naseleniy_punkt_type_id_ref_I',
                            'id_naseleniy_punkt_type',
                            1);
        Next;
      end;
    end;
    S_dset.Close;
    j_app_I_dset.Close;
    id_ref_I_dset.Close;
  except on e: Exception do  SaveLog(1, -100, -100, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.INI_TYPE_REGION_0_to_1;
var i: integer;
  id_rec: Int64;
begin

  try
    begin_local_global('Adres.G_sp_adres_oblast_type_exch_S',
                       'EXCH_INI_TYPE_REGION_IU',
                       1);

    with S_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
          if (VarIsNull(FieldValues['id_oblast_type'])) then
            StProc.ParamByName('id_region_type').IsNull := true
          else
            StProc.ParamByName('id_region_type').AsInt64 := FieldValues['id_oblast_type'];
          //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['full_name_oblast_type'])) then
            StProc.ParamByName('name_full').IsNull := true
          else
            StProc.ParamByName('name_full').AsString := FieldValues['full_name_oblast_type'];
          //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['short_name_oblast_type'])) then
            StProc.ParamByName('name_short').IsNull := true
          else
            StProc.ParamByName('name_short').AsString := FieldValues['short_name_oblast_type'];
          //-------------------------------------------------------------------------------------------------------
          StProc.ParamByName('display_order').AsInt64 := 100;

        in_for_local_global('Adres.G_sp_adres_oblast_type_j_app_I',
                            'Adres.G_sp_adres_oblast_type_id_ref_I',
                            'id_oblast_type',
                            1);
        Next;
      end;
    end;
    S_dset.Close;
    j_app_I_dset.Close;
    id_ref_I_dset.Close;
  except on e: Exception do SaveLog(1, -100, -100, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.INI_TYPE_STREET_0_to_1;
var i: integer;
  id_rec: Int64;
begin

  try
    begin_local_global('Adres.G_sp_adres_ulici_type_exch_S',
                       'EXCH_INI_TYPE_STREET_IU',
                       1);

    with S_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
          if (VarIsNull(FieldValues['id_ulici_type'])) then
            StProc.ParamByName('id_type_street').IsNull := true
          else
            StProc.ParamByName('id_type_street').AsInt64 := FieldValues['id_ulici_type'];
          //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['full_name_ulici_type'])) then
            StProc.ParamByName('name_full').IsNull := true
          else
            StProc.ParamByName('name_full').AsString := FieldValues['full_name_ulici_type'];
          //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['short_name_ulici_type'])) then
            StProc.ParamByName('name_short').IsNull := true
          else
            StProc.ParamByName('name_short').AsString := FieldValues['short_name_ulici_type'];
          //-------------------------------------------------------------------------------------------------------
          StProc.ParamByName('dysplay_order').AsInt64 := 100;

        in_for_local_global('Adres.G_sp_adres_ulici_type_j_app_I',
                            'Adres.G_sp_adres_ulici_type_id_ref_I',
                            'id_ulici_type',
                            1);
        Next;
      end;
    end;
    S_dset.Close;
    j_app_I_dset.Close;
    id_ref_I_dset.Close;
  except on e: Exception do SaveLog(1, -100, -100, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.INI_TYPE_DISTRICT_0_to_1;
var i: integer;
  id_rec: Int64;
begin

  try
    begin_local_global('Adres.G_sp_adres_admin_rayon_type_exch_S',
                       'EXCH_INI_TYPE_DISTRICT_IU',
                       1);

    with S_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
          if (VarIsNull(FieldValues['id_admin_rayon_type'])) then
            StProc.ParamByName('id_type_district').IsNull := true
          else
            StProc.ParamByName('id_type_district').AsInt64 := FieldValues['id_admin_rayon_type'];
          //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['full_name_admin_rayon_type'])) then
            StProc.ParamByName('name_full').IsNull := true
          else
            StProc.ParamByName('name_full').AsString := FieldValues['full_name_admin_rayon_type'];
          //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['short_name_admin_rayon_type'])) then
            StProc.ParamByName('name_short').IsNull := true
          else
            StProc.ParamByName('name_short').AsString := FieldValues['short_name_admin_rayon_type'];
          //------------------------------------------------------------------------------------------------------
          StProc.ParamByName('dysplay_order').AsInt64 := 100;

        in_for_local_global('Adres.G_sp_adres_admin_rayon_type_j_app_I',
                            'Adres.G_sp_adres_admin_rayon_type_id_ref_I',
                            'id_admin_rayon_type',
                            1);
        Next;
      end;
    end;
    S_dset.Close;
    j_app_I_dset.Close;
    id_ref_I_dset.Close;
  except on e: Exception do SaveLog(1, -100, -100, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.PUB_INI_PASS_TYPE_0_to_1;
var i: integer;
  id_rec: Int64;
begin

  try
    begin_local_global('Person.G_sp_pasport_type_exch_S',
                       'EXCH_PUB_INI_PASS_TYPE_IU',
                       1);

    with S_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
          if (VarIsNull(FieldValues['id_pasport_type'])) then
            StProc.ParamByName('id_pass_type').IsNull := true
          else
            StProc.ParamByName('id_pass_type').AsInt64 := FieldValues['id_pasport_type'];
          //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['Name_pasport_type'])) then
            StProc.ParamByName('pass_type_name').IsNull := true
          else
            StProc.ParamByName('pass_type_name').AsString := FieldValues['Name_pasport_type'];

        in_for_local_global('Person.G_sp_pasport_type_j_app_I',
                            'Person.G_sp_pasport_type_id_ref_I',
                            'id_pasport_type',
                            1);
        Next;
      end;
    end;
    S_dset.Close;
    j_app_I_dset.Close;
    id_ref_I_dset.Close;
  except on e: Exception do SaveLog(1, -100, -100, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.ADR_COUNTRY_0_to_1;
var i: integer;
  id_rec: Int64;
begin

  try
    begin_local_global('Adres.G_dt_adres_strana_exch_S',
                       'EXCH_ADR_COUNTRY_IU',
                       1);

    with S_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
          if (VarIsNull(FieldValues['id_strana'])) then
            StProc.ParamByName('id_country').IsNull := true
          else
            StProc.ParamByName('id_country').AsInt64 := FieldValues['id_strana'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['name_strana'])) then
            StProc.ParamByName('name_country').IsNull := true
          else
            StProc.ParamByName('name_country').AsString := FieldValues['name_strana'];

        StProc.ParamByName('npp').AsInteger := 1000;

        in_for_local_global('Adres.G_dt_adres_strana_j_app_I',
                            'Adres.G_dt_adres_strana_id_ref_I',
                            'id_strana',
                            1);
        Next;
      end;
    end;
    S_dset.Close;
    j_app_I_dset.Close;
    id_ref_I_dset.Close;
  except on e: Exception do SaveLog(1, -100, -100, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.ADR_REGION_0_to_1;
var i: integer;
  id_rec: Int64;
begin

  try
    begin_local_global('Adres.G_dt_adres_oblast_exch_S',
                       'EXCH_ADR_REGION_IU',
                       1);

    with S_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
          if (VarIsNull(FieldValues['id_oblast'])) then
            StProc.ParamByName('id_region').IsNull := true
          else
            StProc.ParamByName('id_region').AsInt64 := FieldValues['id_oblast'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['id_strana'])) then
            StProc.ParamByName('id_country').IsNull := true
          else
            StProc.ParamByName('id_country').AsInt64 := FieldValues['id_strana'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['id_oblast_type'])) then
            StProc.ParamByName('id_region_type').IsNull := true
          else
            StProc.ParamByName('id_region_type').AsInt64 := FieldValues['id_oblast_type'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['name_oblast'])) then
            StProc.ParamByName('name_region').IsNull := true
          else
            StProc.ParamByName('name_region').AsString := FieldValues['name_oblast'];
          //------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['on_ustarelo'])) then
            StProc.ParamByName('is_old').IsNull := true
          else
            StProc.ParamByName('is_old').AsInteger := FieldValues['on_ustarelo'];

        in_for_local_global('Adres.G_dt_adres_oblast_j_app_I',
                            'Adres.G_dt_adres_oblast_id_ref_I',
                            'id_oblast',
                            1);
        Next;
      end;
    end;
    S_dset.Close;
    j_app_I_dset.Close;
    id_ref_I_dset.Close;
  except on e: Exception do SaveLog(1, -100, -100, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.ADR_DISTRICT_0_to_1;
var i: integer;
  id_rec: Int64;
begin

  try
    begin_local_global('Adres.G_dt_adres_admin_rayon_exch_S',
                       'EXCH_ADR_DISTRICT_IU',
                       1);

    with S_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
          if (VarIsNull(FieldValues['id_admin_rayon'])) then
            StProc.ParamByName('id_district').IsNull := true
          else
            StProc.ParamByName('id_district').AsInt64 := FieldValues['id_admin_rayon'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['id_oblast'])) then
            StProc.ParamByName('id_region').IsNull := true
          else
            StProc.ParamByName('id_region').AsInt64 := FieldValues['id_oblast'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['name_admin_rayon'])) then
            StProc.ParamByName('name_district').IsNull := true
          else
            StProc.ParamByName('name_district').AsString := FieldValues['name_admin_rayon'];
          //------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['on_ustarelo'])) then
            StProc.ParamByName('is_old').IsNull := true
          else
            StProc.ParamByName('is_old').AsInteger := FieldValues['on_ustarelo'];

        StProc.ParamByName('id_type_district').AsInteger := 1;    

        in_for_local_global('Adres.G_dt_adres_admin_rayon_j_app_I',
                            'Adres.G_dt_adres_admin_rayon_id_ref_I',
                            'id_admin_rayon',
                            1);
        Next;
      end;
    end;
    S_dset.Close;
    j_app_I_dset.Close;
    id_ref_I_dset.Close;
  except on e: Exception do SaveLog(1, -100, -100, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.ADR_PLACE_0_to_1;
var i: integer;
  id_rec: Int64;
begin

  try
    begin_local_global('Adres.G_dt_adres_naseleniy_punkt_exch_S',
                       'EXCH_ADR_PLACE_IU',
                       1);

    with S_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
          if (VarIsNull(FieldValues['id_naseleniy_punkt'])) then
            StProc.ParamByName('id_place').IsNull := true
          else
            StProc.ParamByName('id_place').AsInt64 := FieldValues['id_naseleniy_punkt'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['id_admin_rayon'])) then
            StProc.ParamByName('id_district').IsNull := true
          else
            StProc.ParamByName('id_district').AsInt64 := FieldValues['id_admin_rayon'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['id_oblast'])) then
            StProc.ParamByName('id_region').IsNull := true
          else
            StProc.ParamByName('id_region').AsInt64 := FieldValues['id_oblast'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['id_naseleniy_punkt_type'])) then
            StProc.ParamByName('id_place_type').IsNull := true
          else
            StProc.ParamByName('id_place_type').AsInt64 := FieldValues['id_naseleniy_punkt_type'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['post_index'])) then
            StProc.ParamByName('zipcode').IsNull := true
          else
            StProc.ParamByName('zipcode').AsString := FieldValues['post_index'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['name_naseleniy_punkt'])) then
            StProc.ParamByName('name_place').IsNull := true
          else
            StProc.ParamByName('name_place').AsString := FieldValues['name_naseleniy_punkt'];
          //------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['on_ustarelo'])) then
            StProc.ParamByName('is_old').IsNull := true
          else
            StProc.ParamByName('is_old').AsInteger := FieldValues['on_ustarelo'];

        in_for_local_global('Adres.G_dt_adres_naseleniy_punkt_j_app_I',
                            'Adres.G_dt_adres_naseleniy_punkt_id_ref_I',
                            'id_naseleniy_punkt',
                            1);
        Next;
      end;
    end;
    S_dset.Close;
    j_app_I_dset.Close;
    id_ref_I_dset.Close;
  except on e: Exception do SaveLog(1, -100, -100, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.ADR_CITY_AREA_0_to_1;
var i: integer;
  id_rec: Int64;
begin

  try
    begin_local_global('Adres.G_dt_adres_gorodskoy_rayon_exch_S',
                       'EXCH_ADR_CITY_AREA_IU',
                       1);

    with S_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
          if (VarIsNull(FieldValues['id_gorodskoy_rayon'])) then
            StProc.ParamByName('id_city_area').IsNull := true
          else
            StProc.ParamByName('id_city_area').AsInt64 := FieldValues['id_gorodskoy_rayon'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['id_naseleniy_punkt'])) then
            StProc.ParamByName('id_place').IsNull := true
          else
            StProc.ParamByName('id_place').AsInt64 := FieldValues['id_naseleniy_punkt'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['name_rayon'])) then
            StProc.ParamByName('name_city_area').IsNull := true
          else
            StProc.ParamByName('name_city_area').AsString := FieldValues['name_rayon'];
          //------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['on_ustarelo'])) then
            StProc.ParamByName('is_old').IsNull := true
          else
            StProc.ParamByName('is_old').AsInteger := FieldValues['on_ustarelo'];

        in_for_local_global('Adres.G_dt_adres_gorodskoy_rayon_j_app_I',
                            'Adres.G_dt_adres_gorodskoy_rayon_id_ref_I',
                            'id_gorodskoy_rayon',
                            1);
        Next;
      end;
    end;
    S_dset.Close;
    j_app_I_dset.Close;
    id_ref_I_dset.Close;
  except on e: Exception do SaveLog(1, -100, -100, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.ADR_STREET_0_to_1;
var i: integer;
  id_rec: Int64;
begin

  try
    begin_local_global('Adres.G_dt_adres_ulici_exch_S',
                       'EXCH_ADR_STREET_IU',
                       1);

    with S_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
          if (VarIsNull(FieldValues['id_ulici'])) then
            StProc.ParamByName('id_street').IsNull := true
          else
            StProc.ParamByName('id_street').AsInt64 := FieldValues['id_ulici'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['id_naseleniy_punkt'])) then
            StProc.ParamByName('id_place').IsNull := true
          else
            StProc.ParamByName('id_place').AsInt64 := FieldValues['id_naseleniy_punkt'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['id_ulici_type'])) then
            StProc.ParamByName('id_type_street').IsNull := true
          else
            StProc.ParamByName('id_type_street').AsInt64 := FieldValues['id_ulici_type'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['name_ulica'])) then
            StProc.ParamByName('name_street').IsNull := true
          else
            StProc.ParamByName('name_street').AsString := FieldValues['name_ulica'];
          //------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['on_ustarelo'])) then
            StProc.ParamByName('is_old').IsNull := true
          else
            StProc.ParamByName('is_old').AsInteger := FieldValues['on_ustarelo'];

        in_for_local_global('Adres.G_dt_adres_ulici_j_app_I',
                            'Adres.G_dt_adres_ulici_id_ref_I',
                            'id_ulici',
                            1);
        Next;
      end;
    end;
    S_dset.Close;
    j_app_I_dset.Close;
    id_ref_I_dset.Close;
  except on e: Exception do SaveLog(1, -100, -100, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.ADR_ADRESS_MAIN_0_to_1;
var i: integer;
  id_rec: Int64;
begin

  try
    begin_local_global('Adres.G_dt_adres_main_exch_S',
                       'EXCH_ADR_ADRESS_MAIN_IU',
                       1);

    with S_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
          if (VarIsNull(FieldValues['id_adres'])) then
            StProc.ParamByName('id_adress').IsNull := true
          else
            StProc.ParamByName('id_adress').AsInt64 := FieldValues['id_adres'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['post_index'])) then
            StProc.ParamByName('zipcode').IsNull := true
          else
            StProc.ParamByName('zipcode').AsString := FieldValues['post_index'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['id_rayon'])) then
            StProc.ParamByName('id_city_area').IsNull := true
          else
            StProc.ParamByName('id_city_area').AsInt64 := FieldValues['id_rayon'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['id_ulica'])) then
            StProc.ParamByName('id_street').IsNull := true
          else
            StProc.ParamByName('id_street').AsInt64 := FieldValues['id_ulica'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['korpus'])) then
            StProc.ParamByName('korpus').IsNull := true
          else
            StProc.ParamByName('korpus').AsString := FieldValues['korpus'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['dom'])) then
            StProc.ParamByName('house').IsNull := true
          else
            StProc.ParamByName('house').AsString := FieldValues['dom'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['kvartira'])) then
            StProc.ParamByName('flat').IsNull := true
          else
            StProc.ParamByName('flat').AsString := FieldValues['kvartira'];

        in_for_local_global('Adres.G_dt_adres_main_j_app_I',
                            'Adres.G_dt_adres_main_id_ref_I',
                            'id_adres',
                            1);
        Next;
      end;
    end;
    S_dset.Close;
    j_app_I_dset.Close;
    id_ref_I_dset.Close;
  except on e: Exception do SaveLog(1, -100, -100, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.PEOPLE_0_to_1;
var i: integer;
  id_rec: Int64;
begin

  try
    begin_local_global('Person.G_dt_fiz_lica_main_exch_S',
                       'EXCH_PEOPLE_IU',
                       1);

    with S_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
          if (VarIsNull(FieldValues['id_fiz_lica'])) then
            StProc.ParamByName('id_man').IsNull := true
          else
            StProc.ParamByName('id_man').AsInt64 := FieldValues['id_fiz_lica'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['familiya_ukr'])) then
            StProc.ParamByName('familia').IsNull := true
          else
            StProc.ParamByName('familia').AsString := FieldValues['familiya_ukr'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['imya_ukr'])) then
            StProc.ParamByName('imya').IsNull := true
          else
            StProc.ParamByName('imya').AsString := FieldValues['imya_ukr'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['otchestvo_ukr'])) then
            StProc.ParamByName('otchestvo').IsNull := true
          else
            StProc.ParamByName('otchestvo').AsString := FieldValues['otchestvo_ukr'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['familiya_rus'])) then
            StProc.ParamByName('rus_familia').IsNull := true
          else
            StProc.ParamByName('rus_familia').AsString := FieldValues['familiya_rus'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['imya_rus'])) then
            StProc.ParamByName('rus_imya').IsNull := true
          else
            StProc.ParamByName('rus_imya').AsString := FieldValues['imya_rus'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['otchestvo_rus'])) then
            StProc.ParamByName('rus_otchestvo').IsNull := true
          else
            StProc.ParamByName('rus_otchestvo').AsString := FieldValues['otchestvo_rus'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['pol'])) then
            StProc.ParamByName('id_sex').IsNull := true
          else
            if (FieldValues['pol']) then
              StProc.ParamByName('id_sex').AsInt64 := 1
            else
              StProc.ParamByName('id_sex').AsInt64 := 2;
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['date_rogdeniya'])) then
            StProc.ParamByName('birth_date').IsNull := true
          else
            StProc.ParamByName('birth_date').AsDate := FieldValues['date_rogdeniya'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['nalog_kod'])) then
            StProc.ParamByName('tin').IsNull := true
          else
            StProc.ParamByName('tin').AsString := FieldValues['nalog_kod'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['id_mesto_rogden'])) then
            StProc.ParamByName('id_birth_place').AsInt64 := -1
          else
            StProc.ParamByName('id_birth_place').AsInt64 := FieldValues['id_mesto_rogden'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['id_adres'])) then
            StProc.ParamByName('id_adress').AsInt64 := -1
          else
            StProc.ParamByName('id_adress').AsInt64 := FieldValues['id_adres'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['num_kartochki_socstrah'])) then
            StProc.ParamByName('soc_card_number').IsNull := true
          else
            StProc.ParamByName('soc_card_number').AsString := FieldValues['num_kartochki_socstrah'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['work_phone'])) then
            StProc.ParamByName('work_phone').IsNull := true
          else
            StProc.ParamByName('work_phone').AsString := FieldValues['work_phone'];;
         //-------------------------------------------------------------------------------------------------------
           if (VarIsNull(FieldValues['home_phone'])) then
            StProc.ParamByName('home_phone').IsNull := true
          else
            StProc.ParamByName('home_phone').AsString := FieldValues['home_phone'];;
         //-------------------------------------------------------------------------------------------------------
           if (VarIsNull(FieldValues['USER_INFO'])) then
            StProc.ParamByName('USER_UPDATE').IsNull := true
          else
            StProc.ParamByName('USER_UPDATE').AsString := FieldValues['USER_INFO'];;
         //-------------------------------------------------------------------------------------------------------
          StProc.ParamByName('id_nationality').IsNull := true;
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['id_strana'])) then
            StProc.ParamByName('id_country').IsNull := true
          else
            StProc.ParamByName('id_country').AsInt64 := FieldValues['id_strana'];
          //------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['on_ustarelo'])) then
            StProc.ParamByName('is_old').IsNull := true
          else
            StProc.ParamByName('is_old').AsInteger := FieldValues['on_ustarelo'];
          //------------------------------------------------------------------------------------------------------

        in_for_local_global('Person.G_dt_fiz_lica_main_j_app_I',
                            'Person.G_dt_fiz_lica_main_id_ref_I',
                            'id_fiz_lica',
                            1);
        Next;
      end;
    end;
    S_dset.Close;
    j_app_I_dset.Close;
    id_ref_I_dset.Close;
  except on e: Exception do SaveLog(1, -100, -100, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.PASS_DATA_0_to_1;
var i: integer;
  id_rec: Int64;
begin

  try
    begin_local_global('Person.G_dt_pasport_exch_S',
                       'EXCH_PASS_DATA_IU',
                       1);

    with S_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
          if (VarIsNull(FieldValues['id_pasport'])) then
            StProc.ParamByName('id_pas_data').IsNull := true
          else
            StProc.ParamByName('id_pas_data').AsInt64 := FieldValues['id_pasport'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['familiya_ukr'])) then
            StProc.ParamByName('familia').IsNull := true
          else
            StProc.ParamByName('familia').AsString := FieldValues['familiya_ukr'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['imya_ukr'])) then
            StProc.ParamByName('imya').IsNull := true
          else
            StProc.ParamByName('imya').AsString := FieldValues['imya_ukr'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['otchestvo_ukr'])) then
            StProc.ParamByName('otchestvo').IsNull := true
          else
            StProc.ParamByName('otchestvo').AsString := FieldValues['otchestvo_ukr'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['familiya_rus'])) then
            StProc.ParamByName('rus_familia').IsNull := true
          else
            StProc.ParamByName('rus_familia').AsString := FieldValues['familiya_rus'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['imya_rus'])) then
            StProc.ParamByName('rus_imya').IsNull := true
          else
            StProc.ParamByName('rus_imya').AsString := FieldValues['imya_rus'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['otchestvo_rus'])) then
            StProc.ParamByName('rus_otchestvo').IsNull := true
          else
            StProc.ParamByName('rus_otchestvo').AsString := FieldValues['otchestvo_rus'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['seria'])) then
            StProc.ParamByName('seria').IsNull := true
          else
            StProc.ParamByName('seria').AsString := FieldValues['seria'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['nomer'])) then
            StProc.ParamByName('number').IsNull := true
          else
            StProc.ParamByName('number').AsString := FieldValues['nomer'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['date_beg'])) then
            StProc.ParamByName('date_beg').IsNull := true
          else
            StProc.ParamByName('date_beg').AsDate := FieldValues['date_beg'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['vidan'])) then
            StProc.ParamByName('vidan').IsNull := true
          else
            StProc.ParamByName('vidan').AsString := FieldValues['vidan'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['id_fiz_lica'])) then
            StProc.ParamByName('id_man').IsNull := true
          else
            StProc.ParamByName('id_man').AsInt64 := FieldValues['id_fiz_lica'];
         //-------------------------------------------------------------------------------------------------------
          if (VarIsNull(FieldValues['id_pasport_type'])) then
            StProc.ParamByName('id_pass_type').IsNull := true
          else
            StProc.ParamByName('id_pass_type').AsInt64 := FieldValues['id_pasport_type'];

        in_for_local_global('Person.G_dt_pasport_j_app_I',
                            'Person.G_dt_pasport_id_ref_I',
                            'id_pasport',
                            1);
        Next;
      end;
    end;
    S_dset.Close;
    j_app_I_dset.Close;
    id_ref_I_dset.Close;
  except on e: Exception do SaveLog(1, -100, -100, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.N_STRAN_2_to_0;
var i: integer;
  id_server,id_action,id_hst_on_server: Int64;
begin
  id_action := -100;
  id_hst_on_server := -100;

	try
    begin_global_local2('Adres.G_dt_adres_strana_exch_app',
                       'EXCH_N_STRAN_S',
                       'EXCH_N_STRAN_APP');

    with SQ_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
        id_action := FieldValues['id_action'];
        id_hst_on_server := FieldValues['id_N_STRAN_hst'];
        //----------------------------------------------------
        if (id_action = -1) then SaveLog(1, id_action, id_hst_on_server, '')
        else
        begin
          with exch_app_dset.Parameters do
          begin
            ParamByName('@id_strana').Value := FieldValues['ID_STRAN'];
            ParamByName('@name_strana').Value := FieldValues['NSTRAN'];
            //----------------------------------------------------
            ParamByName('@id_server').Value := 2;
            ParamByName('@use_beg').Value := FieldValues['use_beg'];
            ParamByName('@use_end').Value := FieldValues['use_end'];
            ParamByName('@id_history_info').Value := null;
            ParamByName('@id_action').Value := id_action;
            ParamByName('@is_applied').Value := FieldValues['is_applied'];
            ParamByName('@is_exchanged').Value := FieldValues['is_exchanged'];
            //----------------------------------------------------
            ParamByName('@chg_name_strana').Value := FieldValues['chg_NSTRAN'];
          end;

          in_for_global_local2('@id_N_STRAN_hst',id_hst_on_server);
        end;

        Next;
      end;
    end;
    SQ_dset.Close;
    exch_app_dset.Close;
    app_dset.Close;
	except on e: Exception do SaveLog(2, id_action, id_hst_on_server, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.CITY_2_to_0;
var i: integer;
  id_server,id_action,id_hst_on_server: Int64;
begin
  id_action := -100;
  id_hst_on_server := -100;

	try
    begin_global_local2('Adres.G_sp_adres_naseleniy_punkt_type_exch_app',
                       'EXCH_CITY_S',
                       'EXCH_CITY_APP');

    with SQ_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
        id_action := FieldValues['id_action'];
        id_hst_on_server := FieldValues['id_CITY_hst'];
        //----------------------------------------------------
        if (id_action = -1) then SaveLog(1, id_action, id_hst_on_server, '')
        else
        begin
          with exch_app_dset.Parameters do
          begin
            ParamByName('@id_naseleniy_punkt_type').Value := FieldValues['KOD_CITY'];
            ParamByName('@full_name_naseleniy_punkt_type').Value := FieldValues['NAME_CITY'];
            ParamByName('@short_name_naseleniy_punkt_type').Value := FieldValues['NAME_S_CIT'];
           //----------------------------------------------------
            ParamByName('@id_server').Value := 2;
            ParamByName('@use_beg').Value := FieldValues['use_beg'];
            ParamByName('@use_end').Value := FieldValues['use_end'];
            ParamByName('@id_history_info').Value := null;
            ParamByName('@id_action').Value := id_action;
            ParamByName('@is_applied').Value := FieldValues['is_applied'];
            ParamByName('@is_exchanged').Value := FieldValues['is_exchanged'];
            //----------------------------------------------------
            ParamByName('@chg_full_name_naseleniy_punkt_type').Value := FieldValues['chg_NAME_CITY'];
            ParamByName('@chg_short_name_naseleniy_punkt_type').Value := FieldValues['chg_NAME_S_CIT'];
          end;

          in_for_global_local2('@id_CITY_hst',id_hst_on_server);
        end;

        Next;
      end;
    end;
    SQ_dset.Close;
    exch_app_dset.Close;
    app_dset.Close;
	except on e: Exception do SaveLog(2, id_action, id_hst_on_server, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.STREET_2_to_0;
var i: integer;
  id_server,id_action,id_hst_on_server: Int64;
begin
  id_action := -100;
  id_hst_on_server := -100;

	try
    begin_global_local2('Adres.G_sp_adres_ulici_type_exch_app',
                       'EXCH_STREET_S',
                       'EXCH_STREET_APP');

    with SQ_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
        id_action := FieldValues['id_action'];
        id_hst_on_server := FieldValues['id_STREET_hst'];
        //----------------------------------------------------
        if (id_action = -1) then SaveLog(1, id_action, id_hst_on_server, '')
        else
        begin
          with exch_app_dset.Parameters do
          begin
            ParamByName('@id_ulici_type').Value := FieldValues['KOD_STREET'];
            ParamByName('@full_name_ulici_type').Value := FieldValues['NAME_STREE'];
            ParamByName('@short_name_ulici_type').Value := FieldValues['NAME_S_STR'];
          //----------------------------------------------------
            ParamByName('@id_server').Value := 2;
            ParamByName('@use_beg').Value := FieldValues['use_beg'];
            ParamByName('@use_end').Value := FieldValues['use_end'];
            ParamByName('@id_history_info').Value := null;
            ParamByName('@id_action').Value := id_action;
            ParamByName('@is_applied').Value := FieldValues['is_applied'];
            ParamByName('@is_exchanged').Value := FieldValues['is_exchanged'];
            //----------------------------------------------------
            ParamByName('@chg_full_name_ulici_type').Value := FieldValues['chg_NAME_STREE'];
            ParamByName('@chg_short_name_ulici_type').Value := FieldValues['chg_NAME_S_STR'];
          end;

          in_for_global_local2('@id_STREET_hst',id_hst_on_server);
        end;

        Next;
      end;
    end;
    SQ_dset.Close;
    exch_app_dset.Close;
    app_dset.Close;
	except on e: Exception do SaveLog(2, id_action, id_hst_on_server, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.S_TERRIT_2_to_0;
var i: integer;
  id_server,id_action,id_hst_on_server: Int64;
begin
  id_action := -100;
  id_hst_on_server := -100;

	try
    begin_global_local2('Adres.G_sp_adres_admin_rayon_type_exch_app',
                       'EXCH_S_TERRIT_S',
                       'EXCH_S_TERRIT_APP');

    with SQ_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
        id_action := FieldValues['id_action'];
        id_hst_on_server := FieldValues['id_S_TERRIT_hst'];
        //----------------------------------------------------
        if (id_action = -1) then SaveLog(1, id_action, id_hst_on_server, '')
        else
        begin
          with exch_app_dset.Parameters do
          begin
            ParamByName('@id_admin_rayon_type').Value := FieldValues['ID_TERRIT'];
            ParamByName('@full_name_admin_rayon_type').Value := FieldValues['TERRITOR'];
            ParamByName('@short_name_admin_rayon_type').Value := FieldValues['TER_SHORT'];
          //----------------------------------------------------
            ParamByName('@id_server').Value := 2;
            ParamByName('@use_beg').Value := FieldValues['use_beg'];
            ParamByName('@use_end').Value := FieldValues['use_end'];
            ParamByName('@id_history_info').Value := null;
            ParamByName('@id_action').Value := id_action;
            ParamByName('@is_applied').Value := FieldValues['is_applied'];
            ParamByName('@is_exchanged').Value := FieldValues['is_exchanged'];
            //----------------------------------------------------
            ParamByName('@chg_full_name_admin_rayon_type').Value := FieldValues['chg_TERRITOR'];
            ParamByName('@chg_short_name_admin_rayon_type').Value := FieldValues['chg_TER_SHORT'];
          end;

          in_for_global_local2('@id_S_TERRIT_hst',id_hst_on_server);
        end;

        Next;
      end;
    end;
    SQ_dset.Close;
    exch_app_dset.Close;
    app_dset.Close;
	except on e: Exception do SaveLog(2, id_action, id_hst_on_server, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.N_PASP_2_to_0;
var i: integer;
  id_server,id_action,id_hst_on_server: Int64;
begin
  id_action := -100;
  id_hst_on_server := -100;

	try
    begin_global_local2('Person.G_sp_pasport_type_exch_app',
                       'EXCH_N_PASP_S',
                       'EXCH_N_PASP_APP');

    with SQ_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
        id_action := FieldValues['id_action'];
        id_hst_on_server := FieldValues['id_N_PASP_hst'];
        //----------------------------------------------------
        if (id_action = -1) then SaveLog(1, id_action, id_hst_on_server, '')
        else
        begin
          with exch_app_dset.Parameters do
          begin
            ParamByName('@id_pasport_type').Value := FieldValues['PAS_DOK'];
            ParamByName('@Name_pasport_type').Value := FieldValues['NPAS_DOK'];
          //----------------------------------------------------
            ParamByName('@id_server').Value := 2;
            ParamByName('@use_beg').Value := FieldValues['use_beg'];
            ParamByName('@use_end').Value := FieldValues['use_end'];
            ParamByName('@id_history_info').Value := null;
            ParamByName('@id_action').Value := id_action;
            ParamByName('@is_applied').Value := FieldValues['is_applied'];
            ParamByName('@is_exchanged').Value := FieldValues['is_exchanged'];
            //----------------------------------------------------
            ParamByName('@chg_Name_pasport_type').Value := FieldValues['chg_NPAS_DOK'];
          end;

          in_for_global_local2('@id_N_PASP_hst',id_hst_on_server);
        end;

        Next;
      end;
    end;
    SQ_dset.Close;
    exch_app_dset.Close;
    app_dset.Close;
	except on e: Exception do SaveLog(2, id_action, id_hst_on_server, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.PEOPLE_2_to_0;
var i: integer;
  id_server,id_action,id_hst_on_server: Int64;
  x: variant;
//  s: string;
//  cl: TClipboard;
begin
  id_action := -100;
  id_hst_on_server := -100;
//  cl:=Clipboard();
//  cl.Clear;

	try
    begin_global_local2('Person.G_dt_fiz_lica_main_exch_app_2',
                       'EXCH_PEOPLE_S',
                       'EXCH_PEOPLE_APP');

    with SQ_dset do
    begin
//      s:='';
      for i:= 0 to RecordCount-1 do
      begin
        id_action := FieldValues['id_action'];
        id_hst_on_server := FieldValues['ID_REC'];
        //----------------------------------------------------
        if (id_action = -1) then SaveLog(1, id_action, id_hst_on_server, '')
        else
        begin
          with exch_app_dset.Parameters do
          begin
            ParamByName('@NFIZL').Value := FieldValues['NFIZL'];
//            s:= s + '@NFIZL='+IntToStr(ParamByName('@NFIZL').Value) +',';
            ParamByName('@TIN').Value := FieldValues['TIN'];
//            s:= s + '@TIN='+ParamByName('@TIN').Value +',';
            ParamByName('@FIO_RU').Value := FieldValues['FIO_RU'];
//            s:= s + '@FIO_RU='+ParamByName('@FIO_RU').Value +',';
            ParamByName('@IMYA_RU').Value := FieldValues['IMYA_RU'];
//            s:= s + '@IMYA_RU='+ParamByName('@IMYA_RU').Value +',';
            ParamByName('@OTCHEST_RU').Value := FieldValues['OTCHEST_RU'];
//            s:= s + '@OTCHEST_RU='+ParamByName('@OTCHEST_RU').Value +',';
            ParamByName('@FIO_UK').Value := FieldValues['FIO_UK'];
//            s:= s + '@FIO_UK='+ParamByName('@FIO_UK').Value +',';
            ParamByName('@IMYA_UK').Value := FieldValues['IMYA_UK'];
//            s:= s + '@IMYA_UK='+ParamByName('@IMYA_UK').Value +',';
            ParamByName('@OTCHEST_UK').Value := FieldValues['OTCHEST_UK'];
//            s:= s + '@OTCHEST_UK='+ParamByName('@OTCHEST_UK').Value +',';
            ParamByName('@DATE_RO').Value := FieldValues['DATE_RO'];
//            s:= s + '@DATE_RO='+DateTimeToStr(ParamByName('@DATE_RO').Value) +',';
            ParamByName('@STAT').Value := FieldValues['STAT'];
//            s:= s + '@STAT='+ParamByName('@STAT').Value +',';
            ParamByName('@KSTRAN_R').Value := FieldValues['KSTRAN_R'];
//            s:= s + '@KSTRAN_R='+IntToStr(ParamByName('@KSTRAN_R').Value) +',';
            ParamByName('@OBLAST_R').Value := FieldValues['OBLAST_R'];
//            s:= s + '@OBLAST_R='+ParamByName('@OBLAST_R').Value +',';
            ParamByName('@RAJON_R').Value := FieldValues['RAJON_R'];
//            s:= s + '@RAJON_R='+ParamByName('@RAJON_R').Value +',';
            ParamByName('@TYP_R').Value := FieldValues['TYP_R'];
//            s:= s + '@TYP_R='+IntToStr(ParamByName('@TYP_R').Value) +',';
            ParamByName('@NASPUNKT_R').Value := FieldValues['NASPUNKT_R'];
//            s:= s + '@NASPUNKT_R='+ParamByName('@NASPUNKT_R').Value +',';
            ParamByName('@KSTRAN').Value := FieldValues['KSTRAN'];
//            s:= s + '@KSTRAN='+IntToStr(ParamByName('@KSTRAN').Value) +',';
//            ParamByName('@MESTO').Value := FieldValues['MESTO'];
            ParamByName('@OBLAST_P').Value := FieldValues['OBLAST_P'];
//            s:= s + '@OBLAST_P='+ParamByName('@OBLAST_P').Value +',';
            ParamByName('@RAJON_P').Value := FieldValues['RAJON_P'];
//            s:= s + '@RAJON_P='+ParamByName('@RAJON_P').Value +',';
            ParamByName('@TYP_P').Value := FieldValues['TYP_P'];
//            s:= s + '@TYP_P='+IntToStr(ParamByName('@TYP_P').Value) +',';
            ParamByName('@NASPUNKT_P').Value := FieldValues['NASPUNKT_P'];
//            s:= s + '@NASPUNKT_P='+ParamByName('@NASPUNKT_P').Value +',';
            ParamByName('@RAJGOR_P').Value := FieldValues['RAJGOR_P'];
//            s:= s + '@RAJGOR_P='+ParamByName('@RAJGOR_P').Value +',';
            ParamByName('@TYP_VUL_P').Value := FieldValues['TYP_VUL_P'];
//            s:= s + '@TYP_VUL_P='+IntToStr(ParamByName('@TYP_VUL_P').Value) +',';
            ParamByName('@VULYCIA_P').Value := FieldValues['VULYCIA_P'];
//            s:= s + '@VULYCIA_P='+ParamByName('@VULYCIA_P').Value +',';
            ParamByName('@NOMDOM_P').Value := FieldValues['NOMDOM_P'];
//            s:= s + '@NOMDOM_P='+ParamByName('@NOMDOM_P').Value +',';
            ParamByName('@DODK_P').Value := FieldValues['DODK_P'];
//            s:= s + '@DODK_P='+ParamByName('@DODK_P').Value +',';
            ParamByName('@KORP_P').Value := FieldValues['KORP_P'];
//            s:= s + '@KORP_P='+ParamByName('@KORP_P').Value +',';
            ParamByName('@KVART_P').Value := FieldValues['KVART_P'];
//            s:= s + '@KVART_P='+ParamByName('@KVART_P').Value +',';
            ParamByName('@TEL_DOM').Value := FieldValues['TEL_DOM'];
//            s:= s + '@TEL_DOM='+ParamByName('@TEL_DOM').Value +',';
            ParamByName('@TEL_RAB').Value := FieldValues['TEL_RAB'];
//            s:= s + '@TEL_RAB='+ParamByName('@TEL_RAB').Value +',';
            ParamByName('@forEMAIL').Value := FieldValues['forEMAIL'];
//            s:= s + '@forEMAIL='+ParamByName('@forEMAIL').Value +',';
            ParamByName('@LOGIN').Value := FieldValues['LOGIN'];
//            s:= s + '@LOGIN='+ParamByName('@LOGIN').Value +',';
            ParamByName('@PAS_DOK').Value := FieldValues['PAS_DOK'];
//            s:= s + '@PAS_DOK='+IntToStr(ParamByName('@PAS_DOK').Value) +',';
            ParamByName('@PAS_SER').Value := FieldValues['PAS_SER'];
//            s:= s + '@PAS_SER='+ParamByName('@PAS_SER').Value +',';
            ParamByName('@PAS_NUM').Value := FieldValues['PAS_NUM'];
//            s:= s + '@PAS_NUM='+ParamByName('@PAS_NUM').Value +',';
            ParamByName('@PAS_DATE').Value := FieldValues['PAS_DATE'];
//            s:= s + '@PAS_DATE='+DateTimeToStr(ParamByName('@PAS_DATE').Value) +',';
            ParamByName('@PAS_VIDAN').Value := FieldValues['PAS_VIDAN'];
//            s:= s + '@PAS_VIDAN='+ParamByName('@PAS_VIDAN').Value +',';
            ParamByName('@KLS').Value := FieldValues['KLS'];
//            s:= s + '@KLS='+IntToStr(ParamByName('@KLS').Value) +',';
            ParamByName('@INDEKS_P').Value := FieldValues['INDEKS_P'];
//            s:= s + '@INDEKS_P='+IntToStr(ParamByName('@INDEKS_P').Value) +',';
            ParamByName('@SSTR_SER').Value := FieldValues['SSTR_SER'];
//            s:= s + '@SSTR_SER='+ParamByName('@SSTR_SER').Value +',';
            ParamByName('@SSTR_NUM').Value := FieldValues['SSTR_NUM'];
//            s:= s + '@SSTR_NUM='+ParamByName('@SSTR_NUM').Value +',';
         //----------------------------------------------------
            ParamByName('@id_server').Value := 2;
//            s:= s + '@id_server=2' +',';
            ParamByName('@use_beg').Value := FieldValues['use_beg'];
//            s:= s + '@use_beg='+',';
            ParamByName('@use_end').Value := FieldValues['use_end'];
//            s:= s + '@use_end='+',';
            ParamByName('@id_history_info').Value := null;
//            s:= s + '@id_history_info='+',';
            ParamByName('@id_action').Value := id_action;
//            s:= s + '@id_action=0'+',';
            ParamByName('@is_applied').Value := FieldValues['is_applied'];
//            s:= s + '@is_applied=0'+',';
            ParamByName('@is_exchanged').Value := FieldValues['is_exchanged'];
//            s:= s + '@is_exchanged=0'+',';
            //----------------------------------------------------
            ParamByName('@chg_TIN').Value := FieldValues['chg_TIN'];
//            s:= s + '@chg_TIN='+',';
            ParamByName('@chg_FIO_RU').Value := FieldValues['chg_FIO_RU'];
//            s:= s + '@chg_FIO_RU='+',';
            ParamByName('@chg_IMYA_RU').Value := FieldValues['chg_IMYA_RU'];
//            s:= s + '@chg_IMYA_RU='+',';
            ParamByName('@chg_OTCHEST_RU').Value := FieldValues['chg_OTCHEST_RU'];
//            s:= s + '@chg_OTCHEST_RU='+',';
            ParamByName('@chg_FIO_UK').Value := FieldValues['chg_FIO_UK'];
//            s:= s + '@chg_FIO_UK='+',';
            ParamByName('@chg_IMYA_UK').Value := FieldValues['chg_IMYA_UK'];
//            s:= s + '@chg_IMYA_UK='+',';
            ParamByName('@chg_OTCHEST_UK').Value := FieldValues['chg_OTCHEST_UK'];
//            s:= s + '@chg_OTCHEST_UK='+',';
            ParamByName('@chg_DATE_RO').Value := FieldValues['chg_DATE_RO'];
//            s:= s + '@chg_DATE_RO='+',';
            ParamByName('@chg_STAT').Value := FieldValues['chg_STAT'];
//            s:= s + '@chg_STAT='+',';
            ParamByName('@chg_KSTRAN_R').Value := FieldValues['chg_KSTRAN_R'];
//            s:= s + '@chg_KSTRAN_R='+',';
            ParamByName('@chg_OBLAST_R').Value := FieldValues['chg_OBLAST_R'];
//            s:= s + '@chg_OBLAST_R='+',';
            ParamByName('@chg_RAJON_R').Value := FieldValues['chg_RAJON_R'];
//            s:= s + '@chg_RAJON_R='+',';
            ParamByName('@chg_TYP_R').Value := FieldValues['chg_TYP_R'];
//            s:= s + '@chg_TYP_R='+',';
            ParamByName('@chg_NASPUNKT_R').Value := FieldValues['chg_NASPUNKT_R'];
//            s:= s + '@chg_NASPUNKT_R='+',';
//            ParamByName('@chg_MESTO').Value := FieldValues['chg_MESTO'];
            ParamByName('@chg_KSTRAN').Value := FieldValues['chg_KSTRAN'];
//            s:= s + '@chg_KSTRAN='+',';
            ParamByName('@chg_INDEKS_P').Value := FieldValues['chg_INDEKS_P'];
//            s:= s + '@chg_INDEKS_P='+',';
            ParamByName('@chg_OBLAST_P').Value := FieldValues['chg_OBLAST_P'];
//            s:= s + '@chg_OBLAST_P='+',';
            ParamByName('@chg_RAJON_P').Value := FieldValues['chg_RAJON_P'];
//            s:= s + '@chg_RAJON_P='+',';
            ParamByName('@chg_TYP_P').Value := FieldValues['chg_TYP_P'];
//            s:= s + '@chg_TYP_P='+',';
            ParamByName('@chg_NASPUNKT_P').Value := FieldValues['chg_NASPUNKT_P'];
//            s:= s + '@chg_NASPUNKT_P='+',';
            ParamByName('@chg_RAJGOR_P').Value := FieldValues['chg_RAJGOR_P'];
//            s:= s + '@chg_RAJGOR_P='+',';
            ParamByName('@chg_TYP_VUL_P').Value := FieldValues['chg_TYP_VUL_P'];
//            s:= s + '@chg_TYP_VUL_P='+',';
            ParamByName('@chg_VULYCIA_P').Value := FieldValues['chg_VULYCIA_P'];
//            s:= s + '@chg_VULYCIA_P='+',';
            ParamByName('@chg_NOMDOM_P').Value := FieldValues['chg_NOMDOM_P'];
//            s:= s + '@chg_NOMDOM_P='+',';
            ParamByName('@chg_DODK_P').Value := FieldValues['chg_DODK_P'];
//            s:= s + '@chg_DODK_P='+',';
            ParamByName('@chg_KORP_P').Value := FieldValues['chg_KORP_P'];
//            s:= s + '@chg_KORP_P='+',';
            ParamByName('@chg_KVART_P').Value := FieldValues['chg_KVART_P'];
//            s:= s + '@chg_KVART_P='+',';
            ParamByName('@chg_TEL_DOM').Value := FieldValues['chg_TEL_DOM'];
//            s:= s + '@chg_TEL_DOM='+',';
            ParamByName('@chg_TEL_RAB').Value := FieldValues['chg_TEL_RAB'];
//            s:= s + '@chg_TEL_RAB='+',';
            ParamByName('@chg_forEMAIL').Value := FieldValues['chg_forEMAIL'];
//            s:= s + '@chg_forEMAIL='+',';
            ParamByName('@chg_LOGIN').Value := FieldValues['chg_LOGIN'];
//            s:= s + '@chg_LOGIN='+',';
            ParamByName('@chg_PAS_DOK').Value := FieldValues['chg_PAS_DOK'];
//            s:= s + '@chg_PAS_DOK='+',';
            ParamByName('@chg_PAS_SER').Value := FieldValues['chg_PAS_SER'];
//            s:= s + '@chg_PAS_SER='+',';
            ParamByName('@chg_PAS_NUM').Value := FieldValues['chg_PAS_DATE'];
//            s:= s + '@chg_PAS_SER='+',';
            ParamByName('@chg_PAS_DATE').Value := FieldValues['chg_PAS_DATE'];
//            s:= s + '@chg_PAS_NUM='+',';
            ParamByName('@chg_PAS_VIDAN').Value := FieldValues['chg_PAS_VIDAN'];
//            s:= s + '@chg_PAS_VIDAN='+',';
            ParamByName('@chg_KLS').Value := FieldValues['chg_KLS'];
//            s:= s + '@chg_KLS='+',';
            ParamByName('@chg_SSTR_SER').Value := FieldValues['chg_SSTR_SER'];
//            s:= s + '@chg_SSTR_SER='+',';
            ParamByName('@chg_SSTR_NUM').Value := FieldValues['chg_SSTR_NUM'];
//            s:= s + '@chg_SSTR_NUM='+',';
          end;

//  cl.AsText := s;
          in_for_global_local2('@ID_REC',id_hst_on_server);
        end;

        Next;
      end;
    end;
    SQ_dset.Close;
    exch_app_dset.Close;
    app_dset.Close;
	except on e: Exception do SaveLog(2, id_action, id_hst_on_server, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.N_STRAN_0_to_2;
var i: integer;
  id_rec: Int64;
begin

  try
    begin_local_global2('Adres.G_dt_adres_strana_exch_S',
                       'EXCH_N_STRAN_IU',
                       2);

    with S_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
          with exch_IU_dset.Parameters do
          begin
            ParamByName('@ID_STRAN').Value := FieldValues['id_strana'];
            ParamByName('@NSTRAN').Value := FieldValues['name_strana'];
            ParamByName('@KSTRAN').Value := 0;
            ParamByName('@KONTINENT').Value := 0;
            ParamByName('@KLS').Value := 0;
            ParamByName('@NSTRAN_RU').Value := '';
          //------------------------------------------------------------------------------------------------------
            ParamByName('@id_rec').Value := null;
          //------------------------------------------------------------------------------------------------------
          end;

        in_for_local_global2('Adres.G_dt_adres_strana_j_app_I',
                            'Adres.G_dt_adres_strana_id_ref_I',
                            'id_strana',
                            2);
        Next;
      end;

    end;
    S_dset.Close;
    id_ref_I_dset.Close;
    j_app_I_dset.Close;
    exch_IU_dset.Close;
  except on e: Exception do SaveLog(2, -100, -100, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.CITY_0_to_2;
var i: integer;
  id_rec: Int64;
begin

  try
    begin_local_global2('Adres.G_sp_adres_naseleniy_punkt_type_exch_S',
                       'dbo.EXCH_CITY_IU',
                       2);

    with S_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
          with exch_IU_dset.Parameters do
          begin
            ParamByName('@KOD_CITY').Value := FieldValues['id_naseleniy_punkt_type'];
            ParamByName('@NAME_CITY').Value := FieldValues['full_name_naseleniy_punkt_type'];
            ParamByName('@NAME_S_CIT').Value := FieldValues['short_name_naseleniy_punkt_type'];
            ParamByName('@PRI').Value := 0;
            ParamByName('@PROP').Value := ' ';
          //------------------------------------------------------------------------------------------------------
            ParamByName('@id_rec').Value := null;
          //------------------------------------------------------------------------------------------------------
          end;

        in_for_local_global2('Adres.G_sp_adres_naseleniy_punkt_type_j_app_I',
                            'Adres.G_sp_adres_naseleniy_punkt_type_id_ref_I',
                            'id_naseleniy_punkt_type',
                            2);
        Next;
      end;

    end;
    S_dset.Close;
    exch_IU_dset.Close;
    j_app_I_dset.Close;
    id_ref_I_dset.Close;
  except on e: Exception do SaveLog(2, -100, -100, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.STREET_0_to_2;
var i: integer;
  id_rec: Int64;
begin

  try
    begin_local_global2('Adres.G_sp_adres_ulici_type_exch_S',
                       'EXCH_STREET_IU',
                       2);

    with S_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
          with exch_IU_dset.Parameters do
          begin
            ParamByName('@KOD_STREET').Value := FieldValues['id_ulici_type'];
            ParamByName('@NAME_STREE').Value := FieldValues['full_name_ulici_type'];
            ParamByName('@NAME_S_STR').Value := FieldValues['short_name_ulici_type'];
            ParamByName('@PRI').Value := 0;
         //------------------------------------------------------------------------------------------------------
            ParamByName('@id_rec').Value := null;
          //------------------------------------------------------------------------------------------------------
          end;

          in_for_local_global2('Adres.G_sp_adres_ulici_type_j_app_I',
                            'Adres.G_sp_adres_ulici_type_id_ref_I',
                            'id_ulici_type',
                            2);
          Next;
      end;
    end;
    S_dset.Close;
    id_ref_I_dset.Close;
    j_app_I_dset.Close;
    exch_IU_dset.Close;
  except on e: Exception do SaveLog(2, -100, -100, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.S_TERRIT_0_to_2;
var i: integer;
  id_rec: Int64;
begin

  try
    begin_local_global2('Adres.G_sp_adres_admin_rayon_type_exch_S',
                       'EXCH_S_TERRIT_IU',
                       2);

    with S_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
          with exch_IU_dset.Parameters do
          begin
            ParamByName('@ID_TERRIT').Value := FieldValues['id_admin_rayon_type'];
            ParamByName('@TERRITOR').Value := FieldValues['full_name_admin_rayon_type'];
            ParamByName('@TER_SHORT').Value := FieldValues['short_name_admin_rayon_type'];
         //------------------------------------------------------------------------------------------------------
            ParamByName('@id_rec').Value := null;
          //------------------------------------------------------------------------------------------------------
        end;

        in_for_local_global2('Adres.G_sp_adres_admin_rayon_type_j_app_I',
                            'Adres.G_sp_adres_admin_rayon_type_id_ref_I',
                            'id_admin_rayon_type',
                            2);
        Next;
      end;

    end;
    S_dset.Close;
    id_ref_I_dset.Close;
    j_app_I_dset.Close;
    exch_IU_dset.Close;
  except on e: Exception do SaveLog(2, -100, -100, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.N_PASP_0_to_2;
var i: integer;
  id_rec: Int64;
begin

  try
    begin_local_global2('Person.G_sp_pasport_type_exch_S',
                       'EXCH_N_PASP_IU',
                       2);

    with S_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
          with exch_IU_dset.Parameters do
          begin
            ParamByName('@PAS_DOK').Value := FieldValues['id_pasport_type'];
            ParamByName('@NPAS_DOK').Value := FieldValues['Name_pasport_type'];
         //------------------------------------------------------------------------------------------------------
            ParamByName('@id_rec').Value := null;
          //------------------------------------------------------------------------------------------------------
          end;

        in_for_local_global2('Person.G_sp_pasport_type_j_app_I',
                            'Person.G_sp_pasport_type_id_ref_I',
                            'id_pasport_type',
                            2);
        Next;
      end;

    end;
    S_dset.Close;
    id_ref_I_dset.Close;
    j_app_I_dset.Close;
    exch_IU_dset.Close;
  except on e: Exception do SaveLog(2, -100, -100, e.Message);
  end;

end;
///////////////////////////////////////////////////////////////////////////////////////////
procedure TDM_IE.PEOPLE_0_to_2;
var i: integer;
  id_rec: Int64;
begin

  try
    begin_local_global2('Person.G_dt_fiz_lica_main_exch_S_2',
                       'EXCH_PEOPLE_IU',
                       2);

    with S_dset do
    begin
      for i:= 0 to RecordCount-1 do
      begin
          with exch_IU_dset.Parameters do
          begin
            ParamByName('@NFIZL').Value := FieldValues['NFIZL'];
            ParamByName('@TIN').Value := FieldValues['TIN'];
            ParamByName('@FIO_RU').Value := FieldValues['FIO_RU'];
            ParamByName('@IMYA_RU').Value := FieldValues['IMYA_RU'];
            ParamByName('@OTCHEST_RU').Value := FieldValues['OTCHEST_RU'];
            ParamByName('@FIO_UK').Value := FieldValues['FIO_UK'];
            ParamByName('@IMYA_UK').Value := FieldValues['IMYA_UK'];
            ParamByName('@OTCHEST_UK').Value := FieldValues['OTCHEST_UK'];
            ParamByName('@DATE_RO').Value := FieldValues['DATE_RO'];
            ParamByName('@STAT').Value := FieldValues['STAT'];
            ParamByName('@OBLAST_R').Value := FieldValues['OBLAST_R'];
            ParamByName('@RAJON_R').Value := FieldValues['RAJON_R'];
            ParamByName('@TYP_R').Value := FieldValues['TYP_R'];
            ParamByName('@NASPUNKT_R').Value := FieldValues['NASPUNKT_R'];
            ParamByName('@INDEKS_P').Value := FieldValues['INDEKS_P'];
            ParamByName('@OBLAST_P').Value := FieldValues['OBLAST_P'];
            ParamByName('@RAJON_P').Value := FieldValues['RAJON_P'];
            ParamByName('@TYP_P').Value := FieldValues['TYP_P'];
            ParamByName('@NASPUNKT_P').Value := FieldValues['NASPUNKT_P'];
            ParamByName('@TYP_VUL_P').Value := FieldValues['TYP_VUL_P'];
            ParamByName('@VULYCIA_P').Value := FieldValues['VULYCIA_P'];
            ParamByName('@NOMDOM_P').Value := FieldValues['NOMDOM_P'];
            ParamByName('@DODK_P').Value := FieldValues['DODK_P'];
            ParamByName('@KORP_P').Value := FieldValues['KORP_P'];
            ParamByName('@KVART_P').Value := FieldValues['KVART_P'];
            ParamByName('@TEL_DOM').Value := FieldValues['TEL_DOM'];
            ParamByName('@TEL_RAB').Value := FieldValues['TEL_RAB'];
            ParamByName('@forEMAIL').Value := FieldValues['forEMAIL'];
            ParamByName('@LOGIN').Value := FieldValues['LOGIN'];
            ParamByName('@PAS_SER').Value := FieldValues['PAS_SER'];
            ParamByName('@PAS_NUM').Value := FieldValues['PAS_NUM'];
            ParamByName('@PAS_VIDAN').Value := FieldValues['PAS_VIDAN'];
            ParamByName('@PAS_DATE').Value := FieldValues['PAS_DATE'];
            ParamByName('@FIO').Value := '';
            ParamByName('@UKRFIO').Value := '';
            ParamByName('@NOT_GR_UK').Value := 0;
            ParamByName('@KLS').Value := FieldValues['KLS'];
            ParamByName('@KSTRAN').Value := FieldValues['KSTRAN'];
//            ParamByName('@MESTO').Value := FieldValues[''];
            ParamByName('@PAS_DOK').Value := FieldValues['PAS_DOK'];
            ParamByName('@KSTRAN_R').Value := FieldValues['KSTRAN_R'];
            ParamByName('@SSTR_SER').Value := FieldValues['SSTR_SER'];
            ParamByName('@SSTR_NUM').Value := FieldValues['SSTR_NUM'];
            ParamByName('@RAJGOR_P').Value := FieldValues['RAJGOR_P'];
            ParamByName('@TERRIT_P').Value := 0;
            ParamByName('@TERRIT_R').Value := 0;
         //------------------------------------------------------------------------------------------------------
            ParamByName('@id_rec').Value := null;
          //------------------------------------------------------------------------------------------------------
          end;

        in_for_local_global2('Person.G_dt_fiz_lica_main_j_app_I',
                            'Person.G_dt_fiz_lica_main_id_ref_I',
                            'NFIZL',
                            2);
        Next;
      end;

    end;
    S_dset.Close;
    id_ref_I_dset.Close;
    j_app_I_dset.Close;
    exch_IU_dset.Close;
  except on e: Exception do SaveLog(2, -100, -100, e.Message);
  end;

end;

procedure TDM_IE.DataModuleCreate(Sender: TObject);
begin
  Log_Msg:='';
end;

end.


