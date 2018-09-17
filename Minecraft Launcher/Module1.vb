Module Module1

    Sub Main()
        Console.WriteLine("Cargando...")
        Try
            Shell("minecraft.exe --workDir files_minecraft", 3)
        Catch FileNotFound As System.IO.FileNotFoundException
            Console.WriteLine()
            Console.ForegroundColor = ConsoleColor.Red
            Console.WriteLine("Error: minecraft.exe no encontrado.")
            MsgBox("Error: Launcher original de Minecraft no encontrado.")
        End Try

    End Sub

End Module
