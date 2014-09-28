unit uLib;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uLib                                                                       *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Библиотека классов общего назначения.                                      *
*                                                                              *
* Copyright  ©  Год 2005,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}


interface

uses SysUtils, Classes, Windows, Registry;

const
	cBYTE_IN_MEGABYTE = 1048576;         //Количество байт, содержащихся в 1 мегабайте
    cFORMAT_FILE_SIZE = '0.000000,';     //Формат представления размера файла

type

	{ *** Назначение: хранение некоторого набора параметров *** }
	TUsrObject = class(TPersistent)
	private
		FFileSize       : Extended;
		FFileDateChange : TDateTime;

		function  GetFileSize       : Extended;
		function  GetFileDateChange : TDateTime;
	public
		procedure PutFileSize       ( aValue: Integer );
		procedure PutFileDateChange ( aValue: Integer );

		property FileSize       : Extended  read GetFileSize;
		property FileDateChange : TDateTime read GetFileDateChange;
	end;

	{ *** Назначение: хранение набора параметров множества файлов *** }
	TUsrStringList = class(TStringList)
	public
		destructor Destroy; override;
	end;

	{ *** Назначение: хранение набора конфигурационных параметров в системном реестре *** }
	TUsrRegistry = class(TRegistry)
	public
        constructor Create ( aRootKey: HKey ); overload;
	end;

implementation

{ TUsrStringList }

function TUsrObject.GetFileDateChange: TDateTime;
begin
  Result := FFileDateChange;
end;

function TUsrObject.GetFileSize: Extended;
begin
  Result := FFileSize;
end;

procedure TUsrObject.PutFileDateChange(aValue: Integer);
begin
  FFileDateChange := FileDateToDateTime( aValue );
end;

procedure TUsrObject.PutFileSize(aValue: Integer);
begin
  FFileSize := aValue/cBYTE_IN_MEGABYTE;
end;

destructor TUsrStringList.Destroy;
var
    i, n : Integer;
begin
    n := Count - 1;

    //Освобождаем ресурсы, выделенные для объектов, связанных с элементами списка
    for i := 0 to n
    do begin
        if Assigned( Objects[i] )
        then begin
            Objects[i].Free;
            Objects[i] := nil;
        end;
    end;

    //Уничтожаем экземпляр класса
    inherited Destroy;
end;

{ TUsrRegistry }

constructor TUsrRegistry.Create(aRootKey: HKey);
begin
    inherited Create;
    RootKey := aRootKey
end;

end.
