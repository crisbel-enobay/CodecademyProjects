<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <title>Adhoc</title>
</head>

<body>
    <!-- Navbar Component -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#"><img src="https://content.codecademy.com/courses/learn-bootstrap-4/adhoc/logo.png" alt="adhoc logo"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#about">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#team">Our Team</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact Us</a>
                </li>
        </div>
    </nav>

    <!-- Jumbotron -->
    <div class="jumbotron jumbotron-fluid" style="background:url(https://content.codecademy.com/courses/learn-bootstrap-4/adhoc/jumbotron.png) no-repeat; background-size: cover;">
        <div class="bg-secondary my-5">
            <h1 class="display-3 text-white text-center">Administration made easy</h1>
            <p class="text-white text-center">Adhoc is an on-demand administrative service for your company growth.</p>
        </div>
    </div>

    <!-- Container -->
    <div class="container">
        <!-- Quote Section -->
        <div class="row">
            <div class="col">
                <h2 class="font-italic font-weight-light text-left">"Thanks to Adhoc we now have beautiful and faithful service every
                    day. Our customers are happy and engagement has drastically increased. Highly recommend!"</h2>
                <p class="text-right font-italic font-weight-bold">-Dave Ellavar, <span class="font-italic font-weight-light">Academy of Code</span></p>
            </div>
        </div>
        <hr>

        <!-- Why Adhoc? Text -->
        <div id="about" class="row">
            <div class="col">
                <h2 class="display-4 text-center my-5">Why Adhoc?</h2>
            </div>
        </div>

        <!-- Image Reasons Section -->
        <div class="row justify-content-center mb-5">
            <div class="col-8 col-md-4">
                <!-- First card goes here -->
                <div class="card border-0">
                    <img src="https://content.codecademy.com/courses/learn-bootstrap-4/adhoc/experienced.png?_gl=1*9j0q5y*_ga*NTM4MjI2NTQzMC4xNjczNjA3MzQ3*_ga_3LRZM6TM9L*MTY5MzM3MDcxOC4zMS4xLjE2OTMzNzYyNjMuNjAuMC4w" class="card-img-top" alt="experience icon">
                    <div class="card-body">
                        <p class="text-center">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>

                </div>
            </div>

            <div class="col-8 col-md-4">
                <!-- Second card goes here -->
                <div class="card border-0">
                    <img src="https://content.codecademy.com/courses/learn-bootstrap-4/adhoc/fun.png?_gl=1*1oj5lw3*_ga*NTM4MjI2NTQzMC4xNjczNjA3MzQ3*_ga_3LRZM6TM9L*MTY5MzM3MDcxOC4zMS4xLjE2OTMzNzgxMTYuNjAuMC4w" class="card-img-top" alt="fun icon">
                    <div class="card-body">
                        <p class="text-center">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                </div>
            </div>

            <div class="col-8 col-md-4">
                <!-- Third card goes here -->
                <div class="card border-0">
                    <img src="https://content.codecademy.com/courses/learn-bootstrap-4/adhoc/smart.png?_gl=1*1oj5lw3*_ga*NTM4MjI2NTQzMC4xNjczNjA3MzQ3*_ga_3LRZM6TM9L*MTY5MzM3MDcxOC4zMS4xLjE2OTMzNzgxMTYuNjAuMC4w" class="card-img-top" alt="smart icon">
                    <div class="card-body">
                        <p class="text-center">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Meet the Team Section -->
        <div id="team" class="row bg-dark rounded-top">
            <div class="col">
                <h2 class="display-4 text-center text-white">Meet the Team</h2>
            </div>
        </div>

        <!-- Team Pictures Carousel -->
        <div class="row bg-dark rounded-bottom">
            <div class="col">
                <!-- Carousel Component -->
                <div id="carouselExampleControls" class="carousel slide w-50 mx-auto" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="https://content.codecademy.com/courses/learn-bootstrap-4/adhoc/brian.png?_gl=1*1dc2xv8*_ga*NTM4MjI2NTQzMC4xNjczNjA3MzQ3*_ga_3LRZM6TM9L*MTY5MzM3MDcxOC4zMS4xLjE2OTMzNzkxNDguNjAuMC4w" class="d-block w-100" alt="picture of Brian M. the CEO">
                            <div class="carousel-caption bg-dark  rounded-pill py-0">
                                <p class="font-weight-bold text-center text-white mb-0">CEO:<span class="font-weight-light"> Brian M.</span></p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="https://content.codecademy.com/courses/learn-bootstrap-4/adhoc/andy.png?_gl=1*1dc2xv8*_ga*NTM4MjI2NTQzMC4xNjczNjA3MzQ3*_ga_3LRZM6TM9L*MTY5MzM3MDcxOC4zMS4xLjE2OTMzNzkxNDguNjAuMC4w" class="d-block w-100" alt="picture of Andy C. the CFO">
                            <div class="carousel-caption bg-dark  rounded-pill py-0">
                                <p class="font-weight-bold text-center text-white mb-0">CFO:<span class="font-weight-light"> Andy C.</span></p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="https://content.codecademy.com/courses/learn-bootstrap-4/adhoc/angela.png?_gl=1*1nd66um*_ga*NTM4MjI2NTQzMC4xNjczNjA3MzQ3*_ga_3LRZM6TM9L*MTY5MzM3MDcxOC4zMS4xLjE2OTMzNzkxNDguNjAuMC4w" class="d-block w-100" alt="picture of Angela W. the COO">
                            <div class="carousel-caption bg-dark  rounded-pill py-0">
                                <p class="font-weight-bold text-center text-white mb-0">COO:<span class="font-weight-light"> Angela W.</span></p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="https://content.codecademy.com/courses/learn-bootstrap-4/adhoc/amie.png?_gl=1*1nd66um*_ga*NTM4MjI2NTQzMC4xNjczNjA3MzQ3*_ga_3LRZM6TM9L*MTY5MzM3MDcxOC4zMS4xLjE2OTMzNzkxNDguNjAuMC4w" class="d-block w-100" alt="picture of Amie S. the CTO">
                            <div class="carousel-caption bg-dark  rounded-pill py-0">
                                <p class="font-weight-bold text-center text-white mb-0">CTO:<span class="font-weight-light"> Amie S.</span></p>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>

    </div>

    <!-- Footer -->
    <footer class="text-center">2019 Adhoc &copy;</footer>

    <!-- Bootstrap's JavaScript Files -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</body>

</html>