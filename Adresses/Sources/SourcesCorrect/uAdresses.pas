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
        uAdr_DataModule, IBase, AdrSp_MainForm;

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

uses SysUtils, uFormControl, Variants, uAddModifAdr3, uUnivSprav;

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


    if IsConnected then
    begin
        DataModule.pFIBT_ReadAdr.Active := False;
        DataModule.pFIBT_WriteAdr.Active := False;
    end;

    ShortDateFormat:=SDFormat;
    LongDateFormat:=LDFormat;

    DataModule.Free;

    inherited Destroy;
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
    AddF3:TAddModifAdrForm3;
    Params:TSpParams;
    OutPut2: TRxMemoryData;

begin
    if not IsConnected then PrepareConnect;

    if (Input['ShowStyle']=6) then
     begin
      Params.FormCaption:='Довідник країн';
      Params.ShowMode:=AdrSp_MainForm.fsmSelect;
      Params.ShowButtons:=[AdrSp_MainForm.fbAdd,AdrSp_MainForm.fbDelete,AdrSp_MainForm.fbModif,AdrSp_MainForm.fbExit];
      Params.AddFormClass:='TAdd_Country_Form';
      Params.ModifFormClass:='TAdd_Country_Form';
      Params.TableName:='adr_country_select';
      Params.Fields:='Name_country,id_country';
      Params.FieldsName:='Назва';
      Params.KeyField:='id_country';
      Params.ReturnFields:='Name_country,id_country';
      Params.DeleteSQL:='execute procedure adr_country_d(:id_country);';
      Params.DBHandle:=Input['DBHandle'];
      //Params.NameForSearch:=CBCountry.EditText;

      OutPut2:=TRxMemoryData.Create(Application.MainForm);

      if GetAdressesSp(Params,OutPut2) then
       begin
         Output.Append;
         output['id_adress']:=output2['id_country'];
         output['Name_Adr']:=output2['Name_country'];
         Output.post;
       end;
      OutPut2.Free;
     end;

    if (Input['ShowStyle']=5) then
     begin
       if (not VarIsNull(Input['form_caption']))
        then Params.FormCaption:=Input['form_caption']
        else Params.FormCaption:='Довідник населених пунктів';

       Params.ShowMode:=AdrSp_MainForm.fsmSelect;
       Params.ShowButtons:=[AdrSp_MainForm.fbAdd,AdrSp_MainForm.fbDelete,AdrSp_MainForm.fbModif,AdrSp_MainForm.fbExit];
       Params.AddFormClass:='TAdd_Place_Form';
       Params.ModifFormClass:='TAdd_Place_Form';
       Params.TableName:='ADR_PLACE_SELECT_SP(NULL,NULL)';
       Params.Fields:='Name_place_SP,NAME_TYPE,NAME_DISTRICT,NAME_REGION,NAME_COUNTRY,ZIP,id_place,NAME_PLACE';
       Params.FieldsName:='Населений пункт, Тип ,Район, Регіон, Країна, Індекси';
       Params.KeyField:='id_place';
       Params.ReturnFields:='Name_place,id_place';
       Params.DeleteSQL:='execute procedure adr_place_d(:id_place);';
       Params.DBHandle:=Input['DBHandle'];

       OutPut2:=TRxMemoryData.Create(Application.MainForm);

       if GetAdressesSp(Params,OutPut2)
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
       if VarIsNull(Input['Id_Adress']) then
         begin
           Input.Edit;
           Input['Id_Adress']:=0;
           Input.Post;
         end;

       AddF3:=TAddModifAdrForm3.Create(Application.MainForm,DataModule.pFIBDB_Adr.Handle,False,False,Input['Id_Adress']);
       if AddF3.ShowModal=mrOk then
         begin
          Output.Append;
          Output['id_adress']:=AddF3.pIdAddress;
          Output['Name_Adr']:=AddF3.pFullName;
          Output.Post;
         end;
         FreeAndNil(AddF3);
     end;


    if (Input['ShowStyle']=2) then
     begin
       if VarIsNull(Input['Id_Adress']) then
         begin
           Input.Edit;
           Input['Id_Adress']:=0;
           Input.Post;
         end;

       AddF3:=TAddModifAdrForm3.Create(Application.MainForm,DataModule.pFIBDB_Adr.Handle,False,True,Input['Id_Adress']);
       if AddF3.ShowModal=mrOk then
         begin
          Output.Append;
          Output['id_adress']:=AddF3.pIdAddress;
          Output['Name_Adr']:=AddF3.pFullName;
          Output.Post;
         end;
       FreeAndNil(AddF3);
     end;

{    if (Input['ShowStyle']=2) then
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
}
    if (Input['ShowStyle']=3) then
     begin
       if VarIsNull(Input['Id_Adress']) then
         begin
           Input.Edit;
           Input['Id_Adress']:=0;
           Input.Post;
         end;

       AddF3:=TAddModifAdrForm3.Create(Application.MainForm,DataModule.pFIBDB_Adr.Handle,True,False,Input['Id_Adress']);{fmAdd{,null,null}
       if AddF3.ShowModal=mrOk then
         begin
          Output.Append;
          Output['id_adress']:=AddF3.pIdPlace;
          Output['Name_Adr']:=AddF3.pFullName;
          Output.Post;
         end;
         FreeAndNil(AddF3);
{
//       if (Input['Select']=0) then
        AddF2:=TAddBirthPlace.Create(Application.MainForm,DataModule.pFIBDB_Adr.Handle,Input['Id_Adress']);
//       else
//        AddF2:=TAddBirthPlace.Create(Application.MainForm,DataModule.pFIBDB_Adr.Handle,-1);
       if AddF2.ShowModal=mrOk then
        begin
          Output.Append;
          Output['id_adress']:=AddF2.pIdPlace;
          Output['Name_Adr']:=AddF2.pFullName;
          Output.Post;
          DataModule.pFIBDS_Id.Close;
        end;
       AddF2.Free;  }
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
{       with DataModule do
       begin
         if pFIBT_ReadAdr.Active then
          pFIBT_ReadAdr.Commit;
         if pFIBT_WriteAdr.Active then
          pFIBT_WriteAdr.Rollback;
         Free;
       end;  }
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

