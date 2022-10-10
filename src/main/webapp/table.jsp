<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="css-table-18/fonts/icomoon/style.css">

    <link rel="stylesheet" href="css-table-18/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css-table-18/css/bootstrap.min.css">

    <!-- Style -->
    <link rel="stylesheet" href="css-table-18/css/style.css">

    <title>Title</title>
    <script>
        function myFunction() {
            // Declare variables 
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");

            // Loop through all table rows, and hide those who don't match the search query
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
    <style>
        .customSearch {
            padding: 6px 12px;
            width: 100%;
            background: rgb(31, 32, 35);
            border: 1px solid rgb(60, 63, 68);
            border-radius: 4px;
            font-size: 18px;
            color: rgb(247, 248, 248);
            height: 46px;
            appearance: none;
            transition: border 0.15s ease 0s;
        }
    </style>
</head>

<body>


    <div class="content">

        <div class="container">
            <h2 class="mb-5">Table #8</h2>
            <input class="customSearch" type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for Companies.."><br>


            <div class="table-responsive custom-table-responsive">

                <table id="myTable" class="table custom-table">
                    <thead>
                        <tr>
                            <th scope="col">Order</th>
                            <th scope="col">Name</th>
                            <th scope="col">Occupation</th>
                            <th scope="col">Contact</th>
                            <th scope="col">Education</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr scope="row">
                            <td> 1392 </td>
                            <td><a href="#">James Yates</a></td>
                            <td>
                                Web Designer
                                <small class="d-block">Far far away, behind the word mountains</small>
                            </td>
                            <td>+63 983 0962 971</td>
                            <td>NY University</td>
                        </tr>
                        <tr class="spacer">
                            <td colspan="100"></td>
                        </tr>



                    </tbody>
                </table>
            </div>


        </div>

    </div>



    <script src="css-table-18/js/jquery-3.3.1.min.js"></script>
    <script src="css-table-18/js/popper.min.js"></script>
    <script src="css-table-18/js/bootstrap.min.js"></script>
    <script src="css-table-18/js/main.js"></script>
</body>

</html>