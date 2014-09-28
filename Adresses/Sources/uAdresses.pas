{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2005               }
{******************************************************************************}

{                      Пакет "Справочник адресов"                           }
{                 Главный модуль                                               }
{                                               ответственный: Тимофеев Антон  }


unit uAdresses;

interface

uses    uCommonSp, DB, Forms, Dialogs, Controls, uAdrMainForm, RXMemDS,
        uAdr_DataModule, IBase;

type
    TSPAdressSprav = class(TSprav)
    private
        DataModule: TAdrDM;
        IsConnected: Boolean;
        procedure PrepareConnect;
    public
        constructor Create;
        destructor  Destroy;override;
        procedure   Show;override;
        procedure   GetInfo;override;
        function    Exists: boolean;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses SysUtils, uAddModifAdr2, uFormControl, Variants, uAddBirthPlace, uAddModifAdr3, uUnivSprav;

var
SDFormat, LDFormat: String;

function CreateSprav: TSprav;
begin
    Result := TSPAdressSprav.Create;
end;

constructor TSPAdressSprav.Create;
begin
    inherited Create;

    SDFormat:=ShortDateFormat;
    LDFormat:=LongDateFormat;

    ShortDateFormat:='dd.MM.yyyy';
    LongDateFormat:='dd.MMMM.yyyy г.';
        // создание входных/выходных полей
    Input.FieldDefs.Add('id_adress', ftInteger);
    Input.FieldDefs.Add('form_caption', ftString, 255);

    Output.FieldDefs.Add('Id_Adress', ftVariant);
    Output.FieldDefs.Add('Name_Adr', ftString, 255);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

destructor TSPAdressSprav.Destroy;
begin
    inherited Destroy;

    if IsConnected then
    begin
        DataModule.pFIBT_ReadAdr.Active := False;
        DataModule.pFIBT_WriteAdr.Active := False;
    end;

    ShortDateFormat:=SDFormat;
    LongDateFormat:=LDFormat;

    DataModule.Free;
end;

        // подготовить соединение с базой
procedure TSPAdressSprav.PrepareConnect;
var
    hnd: Integer;
begin
    DataModule := TAdrDM.Create(Application.MainForm);

    with DataModule do
    begin
        if pFIBDB_Adr.Connected then
            pFIBDB_Adr.Connected := False;
        hnd := Input['DBHandle'];
        pFIBDB_Adr.Handle := TISC_DB_HANDLE(hnd);
        pFIBDS_SelectAdr.ParamByName('id_adr_pk').AsVariant := Input['Id_Adress'];
    end;
    IsConnected := True;
end;

procedure TSPAdressSprav.Show;
var
    form: TAdrMainForm;
    AddF1:TAddModifAdrForm2;
    AddF2: TAddBirthPlace;
    AddF3:TAddModifAdrForm3;
    Params:TUnivParams;
    OutPut2: TRxMemoryData;

begin
    if not IsConnected then PrepareConnect;

    if (Input['ShowStyle']=5) then
     begin
       if (not VarIsNull(Input['form_caption']))
        then Params.FormCaption:=Input['form_caption']
        else Params.FormCaption:='Довідник міст';

       Params.ShowMode:=fsmSelect;
       Params.ShowButtons:=[fbAdd,fbDelete,fbModif,fbExit];
       Params.AddFormClass:='TAdd_Place_Form';
       Params.ModifFormClass:='TAdd_Place_Form';
       Params.TableName:='adr_place';
       Params.Fields:='Name_place,id_place';
       Params.FieldsName:='Назва';
       Params.KeyField:='id_place';
       Params.ReturnFields:='Name_place,id_place';
       Params.DeleteSQL:='execute procedure adr_place_d(:id_place);';
       Params.DBHandle:=Input['DBHandle'];

       OutPut2:=TRxMemoryData.Create(Application.MainForm);

       if GetUnivSprav(Params,OutPut2)
        then begin
          Output.Append;
          Output['id_adress'] := Output2['id_place'];
          Output['Name_Adr']  := Output2['Name_place'];
          Output.Post;
        end;

       OutPut2.Free;
     end;

    if (Input['ShowStyle']=4) then
     begin
       AddF3:=TAddModifAdrForm3.Create(Application.MainForm,DataModule,fmAdd,null,null);
       if (AddF3.ShowModal=mrOk)and(not VarIsNull(AddF3.qFFC_Adress.LastId)) then
        begin
          DataModule.pFIBDS_Id.ParamByName('id_adress').AsInteger:=AddF3.qFFC_Adress.LastId;
          DataModule.pFIBDS_Id.Open;
          Output.Append;
          Output['id_adress']:=DataModule.pFIBDS_Id['id_adr_pk'];
          Output['Name_Adr']:=DataModule.pFIBDS_Id['full_name'];
          Output.Post;
          DataModule.pFIBDS_Id.Close;
        end;
       AddF3.Free;
     end;

    if (Input['ShowStyle']=2) then
     begin
       AddF1:=TAddModifAdrForm2.Create(Application.MainForm,DataModule,fmAdd,null,null);
       if (AddF1.ShowModal=mrOk)and(not VarIsNull(AddF1.qFFC_Adress.LastId)) then
        begin
          DataModule.pFIBDS_Id.ParamByName('id_adress').AsInteger:=AddF1.qFFC_Adress.LastId;
          DataModule.pFIBDS_Id.Open;
          Output.Append;
          Output['id_adress']:=DataModule.pFIBDS_Id['id_adr_pk'];
          Output['Name_Adr']:=DataModule.pFIBDS_Id['full_name'];
          Output.Post;
          DataModule.pFIBDS_Id.Close;
        end;
       AddF1.Free;
     end;

    if (Input['ShowStyle']=3) then
     begin
       if (Input['Select']=0) then
        AddF2:=TAddBirthPlace.Create(Application.MainForm,DataModule,fmInfo,Input['Id_Adress'])
       else
        AddF2:=TAddBirthPlace.Create(Application.MainForm,DataModule,fmAdd,null);
       if (AddF2.ShowModal=mrOk)and(not VarIsNull(AddF2.qFFC_Adress.LastId)) then
        begin
          DataModule.pFIBDS_Id.ParamByName('id_adress').AsInteger:=AddF2.qFFC_Adress.LastId;
          DataModule.pFIBDS_Id.Open;
          Output.Append;
          Output['id_adress']:=DataModule.pFIBDS_Id['id_adr_pk'];
          Output['Name_Adr']:=DataModule.pFIBDS_Id['full_name'];
          Output.Post;
          DataModule.pFIBDS_Id.Close;
        end;
       AddF2.Free;
     end;

    if (Input['ShowStyle']=0)or((Input['ShowStyle']=1) and (Input['Select']>0)) then
     begin
       form := TAdrMainForm.Create(Application.MainForm, DataModule, Input, Output);
       form.Visible:=false;
       form.ShowModal;
       form.Free;
     end;

    if (Input['ShowStyle']=1) and (Input['Select']=0) then
     begin
       form := TAdrMainForm.Create(Application.MainForm, DataModule, Input, Output);
       form.FormStyle := fsMDIChild;
     end
    else
     begin
       with DataModule do
       begin
         if pFIBT_ReadAdr.Active then
          pFIBT_ReadAdr.Commit;
         if pFIBT_WriteAdr.Active then
          pFIBT_WriteAdr.Rollback;
         Free;
       end;
     end;
end;

function    TSPAdressSprav.Exists: boolean;
begin
    if not IsConnected then PrepareConnect;
    Result := True;
end;

procedure   TSPAdressSprav.GetInfo;
begin
    if not IsConnected then PrepareConnect;
end;

end.

